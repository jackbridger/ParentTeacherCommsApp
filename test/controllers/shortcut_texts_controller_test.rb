require 'test_helper'

class ShortcutTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shortcut_text = shortcut_texts(:one)
  end

  test "should get index" do
    get shortcut_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_shortcut_text_url
    assert_response :success
  end

  test "should create shortcut_text" do
    assert_difference('ShortcutText.count') do
      post shortcut_texts_url, params: { shortcut_text: { body: @shortcut_text.body, teacher_id: @shortcut_text.teacher_id } }
    end

    assert_redirected_to shortcut_text_url(ShortcutText.last)
  end

  test "should show shortcut_text" do
    get shortcut_text_url(@shortcut_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_shortcut_text_url(@shortcut_text)
    assert_response :success
  end

  test "should update shortcut_text" do
    patch shortcut_text_url(@shortcut_text), params: { shortcut_text: { body: @shortcut_text.body, teacher_id: @shortcut_text.teacher_id } }
    assert_redirected_to shortcut_text_url(@shortcut_text)
  end

  test "should destroy shortcut_text" do
    assert_difference('ShortcutText.count', -1) do
      delete shortcut_text_url(@shortcut_text)
    end

    assert_redirected_to shortcut_texts_url
  end
end
