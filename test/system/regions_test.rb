require "application_system_test_case"

class RegionsTest < ApplicationSystemTestCase
  setup do
    @region = regions(:one)
  end

  test "visiting the index" do
    visit regions_url
    assert_selector "h1", text: "Regions"
  end

  test "creating a Region" do
    visit regions_url
    click_on "New Region"

    check "Can signup" if @region.can_signup
    check "Is public" if @region.is_public
    fill_in "Logo", with: @region.logo
    fill_in "M", with: @region.m_id
    fill_in "Name", with: @region.name
    fill_in "Trimmed name", with: @region.trimmed_name
    click_on "Create Region"

    assert_text "Region was successfully created"
    click_on "Back"
  end

  test "updating a Region" do
    visit regions_url
    click_on "Edit", match: :first

    check "Can signup" if @region.can_signup
    check "Is public" if @region.is_public
    fill_in "Logo", with: @region.logo
    fill_in "M", with: @region.m_id
    fill_in "Name", with: @region.name
    fill_in "Trimmed name", with: @region.trimmed_name
    click_on "Update Region"

    assert_text "Region was successfully updated"
    click_on "Back"
  end

  test "destroying a Region" do
    visit regions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Region was successfully destroyed"
  end
end
