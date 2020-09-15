require "application_system_test_case"

class IndustryTaxonomiesTest < ApplicationSystemTestCase
  setup do
    @industry_taxonomy = industry_taxonomies(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit industry_taxonomies_url
    assert_selector "h1", text: "Industries"
  end

  test "creating a Industry taxonomy" do
    visit industry_taxonomies_url
    click_on "New Industry Taxonomy"

    fill_in "Name", with: @industry_taxonomy.name
    select2 "MyString1", from: 'Parent'
    click_on "Create Industry taxonomy"

    assert_text "Industry taxonomy was successfully created"
    #click_on "Back"
  end

  test "updating a Industry taxonomy" do
    visit industry_taxonomies_url
    click_on "MyString", match: :first
    click_on "Edit", match: :first

    fill_in "Name", with: @industry_taxonomy.name
    #fill_in "Parent", with: @industry_taxonomy.parent_id
    click_on "Update Industry taxonomy"

    assert_text "Industry taxonomy was successfully updated"
    #click_on "Back"
  end

  test "destroying a Industry taxonomy" do
    skip
    visit industry_taxonomies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Industry taxonomy was successfully destroyed"
  end
end
