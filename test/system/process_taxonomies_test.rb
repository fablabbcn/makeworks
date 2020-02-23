require "application_system_test_case"

class ProcessTaxonomiesTest < ApplicationSystemTestCase
  setup do
    @process_taxonomy = process_taxonomies(:one)
  end

  test "visiting the index" do
    visit process_taxonomies_url
    assert_selector "h1", text: "Process Taxonomies"
  end

  test "creating a Process taxonomy" do
    visit process_taxonomies_url
    click_on "New Process Taxonomy"

    fill_in "M", with: @process_taxonomy.m_id
    fill_in "Name", with: @process_taxonomy.name
    fill_in "Parent", with: @process_taxonomy.parent_id
    click_on "Create Process taxonomy"

    assert_text "Process taxonomy was successfully created"
    click_on "Back"
  end

  test "updating a Process taxonomy" do
    visit process_taxonomies_url
    click_on "Edit", match: :first

    fill_in "M", with: @process_taxonomy.m_id
    fill_in "Name", with: @process_taxonomy.name
    fill_in "Parent", with: @process_taxonomy.parent_id
    click_on "Update Process taxonomy"

    assert_text "Process taxonomy was successfully updated"
    click_on "Back"
  end

  test "destroying a Process taxonomy" do
    visit process_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Process taxonomy was successfully destroyed"
  end
end
