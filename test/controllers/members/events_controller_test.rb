require 'test_helper'

class Members::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_events_index_url
    assert_response :success
  end

end
