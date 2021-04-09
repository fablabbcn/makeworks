require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
    sign_in users(:one)
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
      post companies_url, params: {
        company: {
          address: @company.address,
          background: @company.background,
          contact_email: @company.contact_email, contact_jobtitle: @company.contact_jobtitle,
          contact_name: @company.contact_name, contact_phone: @company.contact_phone, description: @company.description,
          facebook: @company.facebook, file_types: @company.file_types, film_ready: @company.film_ready, flickr: @company.flickr,
          image_bucket: @company.image_bucket, instagram: @company.instagram, intro: @company.intro, large_run: @company.large_run,
          lat: @company.lat, linkedin: @company.linkedin, lng: @company.lng, location: @company.location, m_id: @company.m_id,
          medium_run: @company.medium_run, minimum_order: @company.minimum_order, name: @company.name, number_of_staff: @company.number_of_staff,
          photo1: @company.photo1, photo2: @company.photo2, photo3: @company.photo3, photo4: @company.photo4, photo5: @company.photo5,
          photo6: @company.photo6, photo7: @company.photo7, photo8: @company.photo8, photo9: @company.photo9, pinterest: @company.pinterest,
          portrait: @company.portrait, sample_production: @company.sample_production,
          short_run: @company.short_run, soft_delete: @company.soft_delete, title: @company.title, top_image: @company.top_image,
          slug: 'slug3', turnaround_time: @company.turnaround_time, twitter: @company.twitter, video_link: @company.video_link,
          website: @company.website, year_founded: @company.year_founded, youtube: @company.youtube
        }
      }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "admin should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "non admin should not get edit" do
    sign_in users(:two)
    get edit_company_url(@company)
    assert_response :redirect
  end

  test "should update company" do
    patch company_url(@company), params: {
      company: {
        address: @company.address, background: @company.background, contact_email: @company.contact_email,
        contact_jobtitle: @company.contact_jobtitle, contact_name: @company.contact_name, contact_phone: @company.contact_phone,
        description: @company.description, facebook: @company.facebook, file_types: @company.file_types, film_ready: @company.film_ready,
        flickr: @company.flickr, image_bucket: @company.image_bucket, instagram: @company.instagram, intro: @company.intro,
        large_run: @company.large_run, lat: @company.lat, linkedin: @company.linkedin, lng: @company.lng, location: @company.location,
        m_id: @company.m_id, medium_run: @company.medium_run, minimum_order: @company.minimum_order, name: @company.name,
        number_of_staff: @company.number_of_staff, photo1: @company.photo1, photo2: @company.photo2, photo3: @company.photo3,
        photo4: @company.photo4, photo5: @company.photo5, photo6: @company.photo6, photo7: @company.photo7, photo8: @company.photo8,
        photo9: @company.photo9, pinterest: @company.pinterest, portrait: @company.portrait,
        sample_production: @company.sample_production, short_run: @company.short_run, soft_delete: @company.soft_delete,
        title: @company.title, top_image: @company.top_image,
        slug: @company.slug,
        turnaround_time: @company.turnaround_time,
        twitter: @company.twitter, video_link: @company.video_link, website: @company.website, year_founded: @company.year_founded,
        youtube: @company.youtube
      }
    }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
