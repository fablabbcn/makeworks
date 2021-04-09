require "application_system_test_case"

class RegionsTest < ApplicationSystemTestCase
  setup do
    @region = regions(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit regions_url
    assert_selector "h1", text: "Regions"
  end

  test "creating a Region" do
    visit new_region_url

    check "Can signup" if @region.can_signup
    check "Is public" if @region.is_public
    #fill_in "Logo", with: @region.logo
    #fill_in "M", with: @region.m_id
    fill_in "Name", with: @region.name
    fill_in "Trimmed name", with: 'slug123'
    click_on "Create Region"

    assert_text "Region was successfully created"
  end

  test "updating a Region" do
    visit regions_url
    click_on @region.name
    click_on "Edit", match: :first

    check "Can signup" if @region.can_signup
    check "Is public" if @region.is_public
    #fill_in "Logo", with: @region.logo
    #fill_in "M", with: @region.m_id
    fill_in "Name", with: @region.name
    fill_in "Trimmed name", with: 'slug456'
    click_on "Update Region"

    assert_text "Region was successfully updated"
  end

  test "destroying a Region" do
    skip
    visit regions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Region was successfully destroyed"
  end
end
