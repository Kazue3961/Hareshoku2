require 'test_helper'

class Members::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_home_index_url
    assert_response :success
  end

end
