require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medium = media(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get media_url
    assert_response :success
  end

  test "should get new" do
    get new_medium_url
    assert_response :success
  end

  test "should create medium" do
    assert_difference('Medium.count') do
      post media_url, params: { medium: { company_id: @medium.company_id, hi_res: @medium.hi_res, m_id: @medium.m_id, thumbnail_url: @medium.thumbnail_url, web_url: @medium.web_url } }
    end

    assert_redirected_to medium_url(Medium.last)
  end

  test "should show medium" do
    get medium_url(@medium)
    assert_response :success
  end

  test "should get edit" do
    get edit_medium_url(@medium)
    assert_response :success
  end

  test "should update medium" do
    patch medium_url(@medium), params: { medium: { company_id: @medium.company_id, hi_res: @medium.hi_res, m_id: @medium.m_id, thumbnail_url: @medium.thumbnail_url, web_url: @medium.web_url } }
    assert_redirected_to medium_url(@medium)
  end

  test "should destroy medium" do
    assert_difference('Medium.count', -1) do
      delete medium_url(@medium)
    end

    assert_redirected_to media_url
  end
end
