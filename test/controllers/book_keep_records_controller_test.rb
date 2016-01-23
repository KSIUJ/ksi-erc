require 'test_helper'

class BookKeepRecordsControllerTest < ActionController::TestCase
  setup do
    @book_keep_record = book_keep_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_keep_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_keep_record" do
    assert_difference('BookKeepRecord.count') do
      post :create, book_keep_record: { BookKeepCategory_id: @book_keep_record.BookKeepCategory_id, User_id: @book_keep_record.User_id, date: @book_keep_record.date, name: @book_keep_record.name, value: @book_keep_record.value }
    end

    assert_redirected_to book_keep_record_path(assigns(:book_keep_record))
  end

  test "should show book_keep_record" do
    get :show, id: @book_keep_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_keep_record
    assert_response :success
  end

  test "should update book_keep_record" do
    patch :update, id: @book_keep_record, book_keep_record: { BookKeepCategory_id: @book_keep_record.BookKeepCategory_id, User_id: @book_keep_record.User_id, date: @book_keep_record.date, name: @book_keep_record.name, value: @book_keep_record.value }
    assert_redirected_to book_keep_record_path(assigns(:book_keep_record))
  end

  test "should destroy book_keep_record" do
    assert_difference('BookKeepRecord.count', -1) do
      delete :destroy, id: @book_keep_record
    end

    assert_redirected_to book_keep_records_path
  end
end
