require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { address: @company.address, background: @company.background, description: @company.description, file_types: @company.file_types, film_ready: @company.film_ready, intro: @company.intro, large_run: @company.large_run, lat: @company.lat, lng: @company.lng, location: @company.location, m_id: @company.m_id, medium_run: @company.medium_run, minimum_order: @company.minimum_order, name: @company.name, number_of_staff: @company.number_of_staff, photo1: @company.photo1, photo2: @company.photo2, photo3: @company.photo3, photo4: @company.photo4, photo5: @company.photo5, photo6: @company.photo6, photo7: @company.photo7, photo8: @company.photo8, photo9: @company.photo9, portrait: @company.portrait, region_id: @company.region_id, sample_production: @company.sample_production, short_run: @company.short_run, soft_delete: @company.soft_delete, top_image: @company.top_image, video_link: @company.video_link, website: @company.website, year_founded: @company.year_founded } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { address: @company.address, background: @company.background, description: @company.description, file_types: @company.file_types, film_ready: @company.film_ready, intro: @company.intro, large_run: @company.large_run, lat: @company.lat, lng: @company.lng, location: @company.location, m_id: @company.m_id, medium_run: @company.medium_run, minimum_order: @company.minimum_order, name: @company.name, number_of_staff: @company.number_of_staff, photo1: @company.photo1, photo2: @company.photo2, photo3: @company.photo3, photo4: @company.photo4, photo5: @company.photo5, photo6: @company.photo6, photo7: @company.photo7, photo8: @company.photo8, photo9: @company.photo9, portrait: @company.portrait, region_id: @company.region_id, sample_production: @company.sample_production, short_run: @company.short_run, soft_delete: @company.soft_delete, top_image: @company.top_image, video_link: @company.video_link, website: @company.website, year_founded: @company.year_founded } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
