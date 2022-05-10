require "test_helper"

class Admin::ShortcutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_shortcuts_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_shortcuts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_shortcuts_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_shortcuts_edit_url
    assert_response :success
  end
end
