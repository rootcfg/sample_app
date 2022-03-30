require "test_helper"

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get pivot" do
    get order_pivot_url
    assert_response :success
  end
end
