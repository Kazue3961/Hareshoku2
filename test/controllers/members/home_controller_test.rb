require 'test_helper'

class Members::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get members_home_top_url
    assert_response :success
  end

end
