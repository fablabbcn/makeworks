require 'test_helper'

class IndustryTaxonomiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @industry_taxonomy = industry_taxonomies(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get industry_taxonomies_url
    assert_response :success
  end

  test "should get new" do
    get new_industry_taxonomy_url
    assert_response :success
  end

  test "should create industry_taxonomy" do
    assert_difference('IndustryTaxonomy.count') do
      post industry_taxonomies_url, params: { industry_taxonomy: { m_id: @industry_taxonomy.m_id, name: @industry_taxonomy.name, parent_id: @industry_taxonomy.parent_id } }
    end

    assert_redirected_to industry_taxonomy_url(IndustryTaxonomy.unscoped.last)
  end

  test "should show industry_taxonomy" do
    get industry_taxonomy_url(@industry_taxonomy)
    assert_response :success
  end

  test "should get edit" do
    get edit_industry_taxonomy_url(@industry_taxonomy)
    assert_response :success
  end

  test "should update industry_taxonomy" do
    patch industry_taxonomy_url(@industry_taxonomy), params: { industry_taxonomy: { m_id: @industry_taxonomy.m_id, name: @industry_taxonomy.name, parent_id: @industry_taxonomy.parent_id } }
    assert_redirected_to industry_taxonomy_url(@industry_taxonomy)
  end

  test "should destroy industry_taxonomy" do
    assert_difference('IndustryTaxonomy.count', -1) do
      delete industry_taxonomy_url(@industry_taxonomy)
    end

    assert_redirected_to industry_taxonomies_url
  end
end
