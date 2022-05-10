require "test_helper"

class Public::ShortcutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shortcuts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_shortcuts_show_url
    assert_response :success
  end
end
