require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit companies_url
    #assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "Submit a m"

    fill_in "Address", with: @company.address
    fill_in "Background", with: @company.background
    fill_in "Contact email", with: @company.contact_email
    fill_in "Contact jobtitle", with: @company.contact_jobtitle
    fill_in "Contact name", with: @company.contact_name
    fill_in "Contact phone", with: @company.contact_phone
    fill_in "Description", with: @company.description
    fill_in "Facebook", with: @company.facebook
    fill_in "File types", with: @company.file_types
    check "Film ready" if @company.film_ready
    fill_in "Flickr", with: @company.flickr
    #fill_in "Image bucket", with: @company.image_bucket
    fill_in "Instagram", with: @company.instagram
    fill_in "Intro", with: @company.intro
    check "Large run" if @company.large_run
    #fill_in "Latitude", with: @company.lat
    fill_in "Linkedin", with: @company.linkedin
    #fill_in "Longitude", with: @company.lng
    fill_in "Location", with: @company.location
    fill_in "M", with: @company.m_id
    check "Medium run" if @company.medium_run
    fill_in "Minimum order", with: @company.minimum_order
    fill_in "Name", with: @company.name
    fill_in "Staff nr", with: @company.number_of_staff
    fill_in "Photo1", with: @company.photo1
    fill_in "Photo2", with: @company.photo2
    fill_in "Photo3", with: @company.photo3
    fill_in "Photo4", with: @company.photo4
    fill_in "Photo5", with: @company.photo5
    fill_in "Photo6", with: @company.photo6
    fill_in "Photo7", with: @company.photo7
    fill_in "Photo8", with: @company.photo8
    fill_in "Photo9", with: @company.photo9
    fill_in "Pinterest", with: @company.pinterest
    fill_in "Portrait", with: @company.portrait
    select2 'Region1', from: 'Region'
    #fill_in "Region", with: @company.region_id
    check "Sample production" if @company.sample_production
    check "Short run" if @company.short_run
    check "Soft delete" if @company.soft_delete
    #fill_in "Title", with: @company.title
    fill_in "Top image", with: @company.top_image
    fill_in "Trimmed name", with: 'slug123'
    fill_in "Turnaround time", with: @company.turnaround_time
    fill_in "Twitter", with: @company.twitter
    fill_in "Video link", with: @company.video_link
    fill_in "Website", with: @company.website
    fill_in "Year founded", with: @company.year_founded
    fill_in "Youtube", with: @company.youtube
    click_on "Create Manufacturer", match: :first

    assert_text "Company was successfully created"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Company1"
    click_on "Edit", match: :first

    fill_in "Address", with: @company.address
    fill_in "Background", with: @company.background
    fill_in "Contact email", with: @company.contact_email
    fill_in "Contact jobtitle", with: @company.contact_jobtitle
    fill_in "Contact name", with: @company.contact_name
    fill_in "Contact phone", with: @company.contact_phone
    fill_in "Description", with: @company.description
    fill_in "Facebook", with: @company.facebook
    fill_in "File types", with: @company.file_types
    check "Film ready" if @company.film_ready
    fill_in "Flickr", with: @company.flickr
    #fill_in "Image bucket", with: @company.image_bucket
    fill_in "Instagram", with: @company.instagram
    fill_in "Intro", with: @company.intro
    check "Large run" if @company.large_run
    #fill_in "Latitude", with: @company.lat
    fill_in "Linkedin", with: @company.linkedin
    #fill_in "Longitude", with: @company.lng
    fill_in "Location", with: @company.location
    fill_in "M", with: @company.m_id
    check "Medium run" if @company.medium_run
    fill_in "Minimum order", with: @company.minimum_order
    fill_in "Name", with: @company.name
    fill_in "Staff nr", with: @company.number_of_staff
    fill_in "Photo1", with: @company.photo1
    fill_in "Photo2", with: @company.photo2
    fill_in "Photo3", with: @company.photo3
    fill_in "Photo4", with: @company.photo4
    fill_in "Photo5", with: @company.photo5
    fill_in "Photo6", with: @company.photo6
    fill_in "Photo7", with: @company.photo7
    fill_in "Photo8", with: @company.photo8
    fill_in "Photo9", with: @company.photo9
    fill_in "Pinterest", with: @company.pinterest
    fill_in "Portrait", with: @company.portrait
    #fill_in "Region", with: @company.region_id
    select2 'Region2', from: 'Region'
    check "Sample production" if @company.sample_production
    check "Short run" if @company.short_run
    check "Soft delete" if @company.soft_delete
    #fill_in "Title", with: @company.title
    fill_in "Top image", with: @company.top_image
    fill_in "Trimmed name", with: 'newslug'
    fill_in "Turnaround time", with: @company.turnaround_time
    fill_in "Twitter", with: @company.twitter
    fill_in "Video link", with: @company.video_link
    fill_in "Website", with: @company.website
    fill_in "Year founded", with: @company.year_founded
    fill_in "Youtube", with: @company.youtube
    click_on "Update", match: :first

    assert_text "Company was successfully updated"
  end

  test "destroying a Company" do
    skip
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
