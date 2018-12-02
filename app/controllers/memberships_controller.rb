class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end
  
  # GET /memberships/filter/1/true
  def show_filtered
    @id  = params[:id]
    @academic_year = Period.where(id: @id).first.academic_year
    #debugger
    #@memberships = Membership.where(period: { academic_year: @academic_year }).all
    
    @memberships = Membership.includes(:period).where('periods.academic_year = ?', @academic_year).references(:periods).all
    #debugger
    if params[:exportable]
      render pdf:             "lista_czlonkow_ksi_#{@academic_year}",
        template:             'memberships/show_filtered.pdf.html.haml',
        encoding:             'UTF-8',
        title:                "Lista członkostw w KSI na okres #{@academic_year} z opłaconą składką",
        margin:               {top: 25, bottom: 20} #na potrzeby użycia papieru kołowego
    end
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

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: "Membership successfully added." }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def prolong
    @membership = Membership.new(membership_params)
    @membership.user = current_user
    @membership.period = Period.current
    @membership.tshirt = false

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: "Membership successfully added." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: "Membership successfully edited." }
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
      format.html { redirect_to memberships_url, notice: 'Membership successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:member_id, {role_ids: []}, :fee_paid)
    end
end
