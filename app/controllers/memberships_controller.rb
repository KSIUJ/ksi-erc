class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end
  
  # GET /memberships/filter/1
  def show_filtered
    @memberships = Membership.where(period_id: params[:id]).all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @membership.comment = Comment.new
    @roles = Role.all
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)
    @membership.user = current_user

    if @membership.fee_paid
      if BookKeepCategory.where(name: "składki").count==0
        n = 'Członkostwo członka pomyślnie dodane. Gdyby istniała kategoria rekordów finansowych "składki" składka zostałaby dodana automatycznie.'
      else
        n = 'Członkostwo członka pomyślnie dodane. Rekord składki został dodany do finansów'
        cat = BookKeepCategory.where(name: "składki").first
        bkr = BookKeepRecord.new
        bkr.date = DateTime.now
        bkr.user = @membership.user
        bkr.book_keep_category = cat
        bkr.name = "Składka członka #{@membership.member.full_name(true)} za okres #{@membership.period.academic_year} (#{@membership.period.info}) [AUTO]"
        bkr.value = @membership.period.fee
        bkr.save
      end
    else
      n = 'Członkostwo członka (bez składki) pomyślnie dodane.'
    end

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: n }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Członkostwo członka pomyślnie zmienione.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Członkostwo członka pomyślnie zniszczone.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:fee_paid, :tshirt, :member_id, { role_ids: [] }, :period_id, comment_attributes: :text, member_attributes: [:name, :surname, :email, :card_id])
    end
end
