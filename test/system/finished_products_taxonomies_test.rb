require "application_system_test_case"

class FinishedProductsTaxonomiesTest < ApplicationSystemTestCase
  setup do
    @finished_products_taxonomy = finished_products_taxonomies(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit finished_products_taxonomies_url
    #assert_selector "h1", text: "Finished Products Taxonomies"
  end

  test "creating a Finished products taxonomy" do
    visit finished_products_taxonomies_url
    click_on "New Finished Products Taxonomy"

    fill_in "M", with: @finished_products_taxonomy.m_id
    fill_in "Name", with: @finished_products_taxonomy.name
    #fill_in "Parent", with: @finished_products_taxonomy.parent_id
    select "Fin1", from: 'Parent'
    click_on "Create Finished products taxonomy"

    assert_text "Finished products taxonomy was successfully created"
    click_on "Back"
  end

  test "updating a Finished products taxonomy" do
    visit finished_products_taxonomies_url
    click_on "Edit", match: :first

    fill_in "M", with: @finished_products_taxonomy.m_id
    fill_in "Name", with: @finished_products_taxonomy.name
    #fill_in "Parent", with: @finished_products_taxonomy.parent_id
    select "Fin2", from: 'Parent'
    click_on "Update Finished products taxonomy"

    assert_text "Finished products taxonomy was successfully updated"
    click_on "Back"
  end

  test "destroying a Finished products taxonomy" do
    visit finished_products_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Finished products taxonomy was successfully destroyed"
  end
end
