class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  # GET /periods
  def index
    @periods = Period.all
  end

  # GET /periods/1
  def show
  end

  # GET /periods/new
  def new
    @period = Period.new
  end

  # GET /periods/1/edit
  def edit
  end

  # POST /periods
  def create
    @period = Period.new(period_params)

    respond_to do |format|
      if @period.save
        format.html { redirect_to @period, notice: 'Period successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /periods/1
  def update
    respond_to do |format|
      if @period.update(period_params)
        format.html { redirect_to @period, notice: 'Period successfully edited.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /periods/1
  def destroy
    @period.destroy
    respond_to do |format|
      format.html { redirect_to periods_url, notice: 'Period successfully deleted.' }
    end
  end

  private
    def set_period
      @period = Period.find(params[:id])
    end

    def period_params
      params.require(:period).permit(:academic_year, :info, :fee)
    end
end
