require "test_helper"

class CharacterTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_tag = character_tags(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get character_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_character_tag_url
    assert_response :success
  end

  test "should create character_tag" do
    assert_difference('CharacterTag.count') do
      post character_tags_url, params: { character_tag: { name: @character_tag.name } }
    end

    assert_redirected_to character_tag_url(CharacterTag.last)
  end

  test "should show character_tag" do
    get character_tag_url(@character_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_tag_url(@character_tag)
    assert_response :success
  end

  test "should update character_tag" do
    patch character_tag_url(@character_tag), params: { character_tag: { name: @character_tag.name } }
    assert_redirected_to character_tag_url(@character_tag)
  end

  test "should destroy character_tag" do
    assert_difference('CharacterTag.count', -1) do
      delete character_tag_url(@character_tag)
    end

    assert_redirected_to character_tags_url
  end
end
