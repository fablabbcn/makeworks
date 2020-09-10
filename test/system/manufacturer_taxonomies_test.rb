require "application_system_test_case"

class ManufacturerTaxonomiesTest < ApplicationSystemTestCase
  setup do
    @manufacturer_taxonomy = manufacturer_taxonomies(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit manufacturer_taxonomies_url
    #assert_selector "h1", text: "Manufacturer Taxonomies"
  end

  test "creating a Manufacturer taxonomy" do
    visit manufacturer_taxonomies_url
    click_on "New Manufacturer Taxonomy"

    fill_in "M", with: @manufacturer_taxonomy.m_id
    fill_in "Name", with: @manufacturer_taxonomy.name
    #fill_in "Parent", with: @manufacturer_taxonomy.parent_id
    click_on "Create Manufacturer taxonomy"

    assert_text "Manufacturer taxonomy was successfully created"
    click_on "Back"
  end

  test "updating a Manufacturer taxonomy" do
    visit manufacturer_taxonomies_url
    click_on "Edit", match: :first

    fill_in "M", with: @manufacturer_taxonomy.m_id
    fill_in "Name", with: @manufacturer_taxonomy.name
    #fill_in "Parent", with: @manufacturer_taxonomy.parent_id
    click_on "Update Manufacturer taxonomy"

    assert_text "Manufacturer taxonomy was successfully updated"
    click_on "Back"
  end

  test "destroying a Manufacturer taxonomy" do
    visit manufacturer_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manufacturer taxonomy was successfully destroyed"
  end
end
