require "application_system_test_case"

class MachinesTaxonomiesTest < ApplicationSystemTestCase
  setup do
    @machines_taxonomy = machines_taxonomies(:one)
  end

  test "visiting the index" do
    visit machines_taxonomies_url
    assert_selector "h1", text: "Machines Taxonomies"
  end

  test "creating a Machines taxonomy" do
    visit machines_taxonomies_url
    click_on "New Machines Taxonomy"

    fill_in "M", with: @machines_taxonomy.m_id
    fill_in "Name", with: @machines_taxonomy.name
    fill_in "Parent", with: @machines_taxonomy.parent_id
    click_on "Create Machines taxonomy"

    assert_text "Machines taxonomy was successfully created"
    click_on "Back"
  end

  test "updating a Machines taxonomy" do
    visit machines_taxonomies_url
    click_on "Edit", match: :first

    fill_in "M", with: @machines_taxonomy.m_id
    fill_in "Name", with: @machines_taxonomy.name
    fill_in "Parent", with: @machines_taxonomy.parent_id
    click_on "Update Machines taxonomy"

    assert_text "Machines taxonomy was successfully updated"
    click_on "Back"
  end

  test "destroying a Machines taxonomy" do
    visit machines_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machines taxonomy was successfully destroyed"
  end
end
