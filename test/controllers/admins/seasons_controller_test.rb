require 'test_helper'

class Admins::SeasonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_seasons_index_url
    assert_response :success
  end

  test "should get create" do
    get admins_seasons_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_seasons_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_seasons_update_url
    assert_response :success
  end

end
