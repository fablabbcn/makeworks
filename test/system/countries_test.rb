require "application_system_test_case"

class CountriesTest < ApplicationSystemTestCase
  setup do
    @country = countries(:one)
  end

  test "visiting the index" do
    visit countries_url
    assert_selector "h1", text: "Countries"
  end

  test "creating a Country" do
    visit countries_url
    click_on "New Country"

    check "Can signup" if @country.can_signup
    check "Is public" if @country.is_public
    fill_in "Logo", with: @country.logo
    fill_in "M", with: @country.m_id
    fill_in "Name", with: @country.name
    fill_in "Trimmed name", with: @country.trimmed_name
    click_on "Create Country"

    assert_text "Country was successfully created"
    click_on "Back"
  end

  test "updating a Country" do
    visit countries_url
    click_on "Edit", match: :first

    check "Can signup" if @country.can_signup
    check "Is public" if @country.is_public
    fill_in "Logo", with: @country.logo
    fill_in "M", with: @country.m_id
    fill_in "Name", with: @country.name
    fill_in "Trimmed name", with: @country.trimmed_name
    click_on "Update Country"

    assert_text "Country was successfully updated"
    click_on "Back"
  end

  test "destroying a Country" do
    visit countries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Country was successfully destroyed"
  end
end
