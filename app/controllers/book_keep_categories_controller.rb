class BookKeepCategoriesController < ApplicationController
  before_action :set_book_keep_category, only: [:show, :edit, :update, :destroy]

  # GET /book_keep_categories
  # GET /book_keep_categories.json
  def index
    @book_keep_categories = BookKeepCategory.all
  end

  # GET /book_keep_categories/1
  # GET /book_keep_categories/1.json
  def show
  end

  # GET /book_keep_categories/new
  def new
    @book_keep_category = BookKeepCategory.new
  end

  # GET /book_keep_categories/1/edit
  def edit
  end

  # POST /book_keep_categories
  # POST /book_keep_categories.json
  def create
    @book_keep_category = BookKeepCategory.new(book_keep_category_params)

    respond_to do |format|
      if @book_keep_category.save
        format.html { redirect_to @book_keep_category, notice: 'Book keep category was successfully created.' }
        format.json { render :show, status: :created, location: @book_keep_category }
      else
        format.html { render :new }
        format.json { render json: @book_keep_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_keep_categories/1
  # PATCH/PUT /book_keep_categories/1.json
  def update
    respond_to do |format|
      if @book_keep_category.update(book_keep_category_params)
        format.html { redirect_to @book_keep_category, notice: 'Book keep category was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_keep_category }
      else
        format.html { render :edit }
        format.json { render json: @book_keep_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_keep_categories/1
  # DELETE /book_keep_categories/1.json
  def destroy
    @book_keep_category.destroy
    respond_to do |format|
      format.html { redirect_to book_keep_categories_url, notice: 'Book keep category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_keep_category
      @book_keep_category = BookKeepCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_keep_category_params
      params.require(:book_keep_category).permit(:name)
    end
end
