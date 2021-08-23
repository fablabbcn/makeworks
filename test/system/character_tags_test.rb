require "application_system_test_case"

class CharacterTagsTest < ApplicationSystemTestCase
  setup do
    @character_tag = character_tags(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit character_tags_url
    assert_selector "h1", text: "Character Tags"
  end

  test "creating a Character tag" do
    visit character_tags_url
    click_on "New Character Tag"

    fill_in "Name", with: @character_tag.name
    click_on "Create Character tag"

    assert_text "Character tag was successfully created"
    click_on "Back"
  end

  test "updating a Character tag" do
    visit character_tags_url
    click_on "Edit", match: :first

    fill_in "Name", with: @character_tag.name
    click_on "Update Character tag"

    assert_text "Character tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Character tag" do
    visit character_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character tag was successfully destroyed"
  end
end
