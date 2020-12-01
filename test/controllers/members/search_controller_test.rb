require 'test_helper'

class Members::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get members_search_search_url
    assert_response :success
  end

end
