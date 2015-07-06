require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect success" do
    get :success
    assert_response :redirect
  end

end