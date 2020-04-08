require 'test_helper'

class RegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @region = regions(:one)
    sign_in users(:one)
  end

  test "should get index" do
    skip
    get regions_url
    assert_response :success
  end

  test "should get new" do
    skip
    get new_region_url
    assert_response :success
  end

  test "should create region" do
    skip
    assert_difference('Region.count') do
      post regions_url, params: { region: { can_signup: @region.can_signup, is_public: @region.is_public, logo: @region.logo, m_id: @region.m_id, name: @region.name, trimmed_name: @region.trimmed_name } }
    end

    assert_redirected_to region_url(Region.last)
  end

  test "should show region" do
    get region_url(@region)
    assert_response :success
  end

  test "should get edit" do
    skip
    get edit_region_url(@region)
    assert_response :success
  end

  test "should update region" do
    skip
    patch region_url(@region), params: { region: { can_signup: @region.can_signup, is_public: @region.is_public, logo: @region.logo, m_id: @region.m_id, name: @region.name, trimmed_name: @region.trimmed_name } }
    assert_redirected_to region_url(@region)
  end

  test "should destroy region" do
    skip
    # Should we be able to destroy a region?
    assert_difference('Region.count', -1) do
      delete region_url(@region)
    end

    assert_redirected_to regions_url
  end
end
