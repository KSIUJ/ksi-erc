require 'test_helper'

class BookLeasesControllerTest < ActionController::TestCase
  setup do
    @book_lease = book_leases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_leases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_lease" do
    assert_difference('BookLease.count') do
      post :create, book_lease: { date_end: @book_lease.date_end, date_start: @book_lease.date_start }
    end

    assert_redirected_to book_lease_path(assigns(:book_lease))
  end

  test "should show book_lease" do
    get :show, id: @book_lease
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_lease
    assert_response :success
  end

  test "should update book_lease" do
    patch :update, id: @book_lease, book_lease: { date_end: @book_lease.date_end, date_start: @book_lease.date_start }
    assert_redirected_to book_lease_path(assigns(:book_lease))
  end

  test "should destroy book_lease" do
    assert_difference('BookLease.count', -1) do
      delete :destroy, id: @book_lease
    end

    assert_redirected_to book_leases_path
  end
end
