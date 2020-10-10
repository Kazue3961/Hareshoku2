require 'test_helper'

class Members::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_posts_index_url
    assert_response :success
  end

  test "should get create" do
    get members_posts_create_url
    assert_response :success
  end

  test "should get new" do
    get members_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get members_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get members_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get members_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get members_posts_destroy_url
    assert_response :success
  end

end
