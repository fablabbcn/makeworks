require "application_system_test_case"

class MaterialsTaxonomiesTest < ApplicationSystemTestCase
  setup do
    @materials_taxonomy = materials_taxonomies(:one)
  end

  test "visiting the index" do
    visit materials_taxonomies_url
    assert_selector "h1", text: "Materials Taxonomies"
  end

  test "creating a Materials taxonomy" do
    visit materials_taxonomies_url
    click_on "New Materials Taxonomy"

    fill_in "M", with: @materials_taxonomy.m_id
    fill_in "Name", with: @materials_taxonomy.name
    fill_in "Parent", with: @materials_taxonomy.parent_id
    click_on "Create Materials taxonomy"

    assert_text "Materials taxonomy was successfully created"
    click_on "Back"
  end

  test "updating a Materials taxonomy" do
    visit materials_taxonomies_url
    click_on "Edit", match: :first

    fill_in "M", with: @materials_taxonomy.m_id
    fill_in "Name", with: @materials_taxonomy.name
    fill_in "Parent", with: @materials_taxonomy.parent_id
    click_on "Update Materials taxonomy"

    assert_text "Materials taxonomy was successfully updated"
    click_on "Back"
  end

  test "destroying a Materials taxonomy" do
    visit materials_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Materials taxonomy was successfully destroyed"
  end
end
