require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit materials_url
    #assert_selector "h1", text: "Materials Taxonomies"
  end

  test "creating a Materials taxonomy" do
    visit materials_url
    click_on "New Materials Taxonomy"

    fill_in "Name", with: @material.name
    click_on "Create Material"

    assert_text "Materials taxonomy was successfully created"
    #click_on "Back"
  end

  test "updating a Materials taxonomy" do
    visit materials_url
    click_on "MyString", match: :first
    click_on "Edit", match: :first

    fill_in "Name", with: @material.name
    #fill_in "Parent", with: @material.parent_id
    click_on "Update Material"

    assert_text "Materials taxonomy was successfully updated"
    #click_on "Back"
  end

  test "destroying a Materials taxonomy" do
    skip
    visit materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Materials taxonomy was successfully destroyed"
  end
end
