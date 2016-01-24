class BookKeepRecordsController < ApplicationController
  include BookKeepRecordsHelper
  before_action :set_book_keep_record, only: [:show, :edit, :update, :destroy]

  # GET /book_keep_records
  # GET /book_keep_records.json
  def index
    @book_keep_records = BookKeepRecord.all
    @sum = 0
    @book_keep_records.each do |book_keep_record|
      @sum += book_keep_record.value
    end
    @sum=format_value(@sum)
  end

  # GET /book_keep_records/filter/1
  def filter
    @book_keep_records = BookKeepRecord.where(book_keep_category_id: params[:id])
    @book_keep_category = @book_keep_records.first.book_keep_category==nil ? "--" : @book_keep_records.first.book_keep_category.name
  end

  # GET /book_keep_records/1
  # GET /book_keep_records/1.json
  def show
  end

  # GET /book_keep_records/new
  def new
    @book_keep_record = BookKeepRecord.new
  end

  # GET /book_keep_records/1/edit
  def edit
  end

  # POST /book_keep_records
  # POST /book_keep_records.json
  def create
    @book_keep_record = BookKeepRecord.new(book_keep_record_params)
    @book_keep_record.user = current_user

    respond_to do |format|
      if @book_keep_record.save
        format.html { redirect_to @book_keep_record, notice: 'Book keep record was successfully created.' }
        format.json { render :show, status: :created, location: @book_keep_record }
      else
        format.html { render :new }
        format.json { render json: @book_keep_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_keep_records/1
  # PATCH/PUT /book_keep_records/1.json
  def update
    respond_to do |format|
      if @book_keep_record.update(book_keep_record_params)
        format.html { redirect_to @book_keep_record, notice: 'Book keep record was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_keep_record }
      else
        format.html { render :edit }
        format.json { render json: @book_keep_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_keep_records/1
  # DELETE /book_keep_records/1.json
  def destroy
    @book_keep_record.destroy
    respond_to do |format|
      format.html { redirect_to book_keep_records_url, notice: 'Book keep record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_keep_record
      @book_keep_record = BookKeepRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_keep_record_params
      params.require(:book_keep_record).permit(:name, :book_keep_category_id, :date, :value)
    end
end
