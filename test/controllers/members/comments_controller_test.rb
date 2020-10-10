require 'test_helper'

class Members::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_comments_index_url
    assert_response :success
  end

  test "should get create" do
    get members_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get members_comments_destroy_url
    assert_response :success
  end

end
