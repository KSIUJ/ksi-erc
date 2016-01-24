require 'test_helper'

class BookKeepCategoriesControllerTest < ActionController::TestCase
  setup do
    @book_keep_category = book_keep_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_keep_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_keep_category" do
    assert_difference('BookKeepCategory.count') do
      post :create, book_keep_category: { name: @book_keep_category.name }
    end

    assert_redirected_to book_keep_category_path(assigns(:book_keep_category))
  end

  test "should show book_keep_category" do
    get :show, id: @book_keep_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_keep_category
    assert_response :success
  end

  test "should update book_keep_category" do
    patch :update, id: @book_keep_category, book_keep_category: { name: @book_keep_category.name }
    assert_redirected_to book_keep_category_path(assigns(:book_keep_category))
  end

  test "should destroy book_keep_category" do
    assert_difference('BookKeepCategory.count', -1) do
      delete :destroy, id: @book_keep_category
    end

    assert_redirected_to book_keep_categories_path
  end
end
