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

    fill_in "Name", with: @finished_products_taxonomy.name
    #fill_in "Parent", with: @finished_products_taxonomy.parent_id
    select2 "Fin1", from: 'Parent'
    click_on "Create Finished products taxonomy"

    assert_text "Finished products taxonomy was successfully created"
  end

  test "updating a Finished products taxonomy" do
    visit finished_products_taxonomies_url
    click_on "Fin1", match: :first
    click_on "Edit", match: :first

    assert_text "Name"
    assert_text "Parent"
    fill_in "Name", with: @finished_products_taxonomy.name
    #fill_in "Parent", with: @finished_products_taxonomy.parent_id
    select2 "Fin2", from: 'Parent'
    click_on "Update Finished products taxonomy"

    assert_text "Finished products taxonomy was successfully updated"
  end

  test "destroying a Finished products taxonomy" do
    skip
    visit finished_products_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Finished products taxonomy was successfully destroyed"
  end
end
