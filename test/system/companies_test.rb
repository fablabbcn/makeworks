require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Address", with: @company.address
    fill_in "Background", with: @company.background
    fill_in "Country", with: @company.country
    fill_in "File types", with: @company.file_types
    fill_in "Intro", with: @company.intro
    check "Large run" if @company.large_run
    fill_in "Lat", with: @company.lat
    fill_in "Lng", with: @company.lng
    fill_in "Location", with: @company.location
    fill_in "M", with: @company.m_id
    check "Medium run" if @company.medium_run
    fill_in "Minimum order", with: @company.minimum_order
    fill_in "Name", with: @company.name
    fill_in "Number of staff", with: @company.number_of_staff
    fill_in "Photo1", with: @company.photo1
    fill_in "Photo2", with: @company.photo2
    fill_in "Photo3", with: @company.photo3
    fill_in "Photo4", with: @company.photo4
    fill_in "Photo5", with: @company.photo5
    fill_in "Photo6", with: @company.photo6
    fill_in "Photo7", with: @company.photo7
    fill_in "Photo8", with: @company.photo8
    fill_in "Photo9", with: @company.photo9
    fill_in "Portrait", with: @company.portrait
    fill_in "Region", with: @company.region_id
    check "Sample production" if @company.sample_production
    check "Short run" if @company.short_run
    check "Soft delete" if @company.soft_delete
    fill_in "Top image", with: @company.top_image
    fill_in "Video link", with: @company.video_link
    fill_in "Website", with: @company.website
    fill_in "Year founded", with: @company.year_founded
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Address", with: @company.address
    fill_in "Background", with: @company.background
    fill_in "Country", with: @company.country
    fill_in "File types", with: @company.file_types
    fill_in "Intro", with: @company.intro
    check "Large run" if @company.large_run
    fill_in "Lat", with: @company.lat
    fill_in "Lng", with: @company.lng
    fill_in "Location", with: @company.location
    fill_in "M", with: @company.m_id
    check "Medium run" if @company.medium_run
    fill_in "Minimum order", with: @company.minimum_order
    fill_in "Name", with: @company.name
    fill_in "Number of staff", with: @company.number_of_staff
    fill_in "Photo1", with: @company.photo1
    fill_in "Photo2", with: @company.photo2
    fill_in "Photo3", with: @company.photo3
    fill_in "Photo4", with: @company.photo4
    fill_in "Photo5", with: @company.photo5
    fill_in "Photo6", with: @company.photo6
    fill_in "Photo7", with: @company.photo7
    fill_in "Photo8", with: @company.photo8
    fill_in "Photo9", with: @company.photo9
    fill_in "Portrait", with: @company.portrait
    fill_in "Region", with: @company.region_id
    check "Sample production" if @company.sample_production
    check "Short run" if @company.short_run
    check "Soft delete" if @company.soft_delete
    fill_in "Top image", with: @company.top_image
    fill_in "Video link", with: @company.video_link
    fill_in "Website", with: @company.website
    fill_in "Year founded", with: @company.year_founded
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
