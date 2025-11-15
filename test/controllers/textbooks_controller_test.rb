require "test_helper"

class TextbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get textbooks_show_url
    assert_response :success
  end
end
