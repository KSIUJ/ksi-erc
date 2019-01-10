class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  def index
    @members = Member.all
  end

  # GET /members/1
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
    File.open('tmp/last_card_id.txt', 'r') do |f|
      @last_card_id = f.gets
    end
  end

  # POST /members
  def create
    puts "dupa"
    puts params
    puts "dupa dupa"
    puts member_params
    puts "dupa dupa dupa"
    @member = Member.new(member_params)
    puts @member.memberships.inspect
    # TODO little bit ugly
    if member_params[:memberships_attributes].present?
      @member.memberships.first.registrar = current_user
      @member.memberships.first.tshirt = false
    end

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Członek pomyślnie dodany.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Członek pomyślnie zmieniony.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  def destroy
    @memberhips = Membership.where(member: @member)
    if @memberhips.count>0
      respond_to do |format|
        format.html { 
          flash[:error] = "Członek posiada instniejące członkostwa - nie można naruszyć integralności bazy danych! Najpierw usuń wszystkie powiązane członkostwa."
          redirect_to members_url
        }
        format.json { head :no_content, status: :unprocessable_entity }
      end
    else
      @member.destroy
      respond_to do |format|
        format.html { redirect_to members_url, notice: 'Członek pomyślnie zniszczony.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :surname, :email, :discord_id, :card_id, memberships_attributes: [{role_ids: []}, :period_id, :fee_paid])
    end
end
