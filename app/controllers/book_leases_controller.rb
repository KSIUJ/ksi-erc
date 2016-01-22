class BookLeasesController < ApplicationController
  before_action :set_book_lease, only: [:show, :edit, :update, :destroy]

  # GET /book_leases
  # GET /book_leases.json
  def index
    @book_leases = BookLease.all
  end

  # GET /book_leases/1
  # GET /book_leases/1.json
  def show
  end

  # GET /book_leases/new
  def new
    @book_lease = BookLease.new
  end

  # GET /book_leases/1/edit
  def edit
  end

  # POST /book_leases
  # POST /book_leases.json
  def create
    @book_lease = BookLease.new(book_lease_params)

    respond_to do |format|
      if @book_lease.save
        format.html { redirect_to @book_lease, notice: 'Book lease was successfully created.' }
        format.json { render :show, status: :created, location: @book_lease }
      else
        format.html { render :new }
        format.json { render json: @book_lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_leases/1
  # PATCH/PUT /book_leases/1.json
  def update
    respond_to do |format|
      if @book_lease.update(book_lease_params)
        format.html { redirect_to @book_lease, notice: 'Book lease was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_lease }
      else
        format.html { render :edit }
        format.json { render json: @book_lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_leases/1
  # DELETE /book_leases/1.json
  def destroy
    @book_lease.destroy
    respond_to do |format|
      format.html { redirect_to book_leases_url, notice: 'Book lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_lease
      @book_lease = BookLease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_lease_params
      params.require(:book_lease).permit(:date_start, :date_end, :active, :member_id, :book_id)
    end
end
