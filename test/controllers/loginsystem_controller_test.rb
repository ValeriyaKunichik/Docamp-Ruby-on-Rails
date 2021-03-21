require "test_helper"

class LoginsystemControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get loginsystem_login_url
    assert_response :success
  end
end
