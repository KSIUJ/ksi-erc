class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  def index
    @memberships_grid = initialize_grid(
      Membership,
      include: [:member, :period, :registrar],
      order: 'memberships.period_id',
      order_direction: 'desc',
    )
  end
  
  # GET /memberships/1
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @roles = Role.all
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  def create
    @membership = Membership.new(membership_params)
    @membership.registrar = current_user

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: "Membership successfully added." }
      else
        format.html { render :new }
      end
    end
  end

  # GET /memberships/prolong
  def prolong
    @membership = Membership.new(membership_params)
    @membership.registrar = current_user
    @membership.period = PeriodsFacade.current
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
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: "Membership successfully edited." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /memberships/1
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership successfully deleted.' }
    end
  end

  private
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:member_id, {role_ids: []}, :fee_paid)
    end
end
