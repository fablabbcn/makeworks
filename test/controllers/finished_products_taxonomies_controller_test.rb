require 'test_helper'

class FinishedProductsTaxonomiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @finished_products_taxonomy = finished_products_taxonomies(:one)
  end

  test "should get index" do
    get finished_products_taxonomies_url
    assert_response :success
  end

  test "should get new" do
    get new_finished_products_taxonomy_url
    assert_response :success
  end

  test "should create finished_products_taxonomy" do
    assert_difference('FinishedProductsTaxonomy.count') do
      post finished_products_taxonomies_url, params: { finished_products_taxonomy: { m_id: @finished_products_taxonomy.m_id, name: @finished_products_taxonomy.name, parent_id: @finished_products_taxonomy.parent_id } }
    end

    assert_redirected_to finished_products_taxonomy_url(FinishedProductsTaxonomy.last)
  end

  test "should show finished_products_taxonomy" do
    get finished_products_taxonomy_url(@finished_products_taxonomy)
    assert_response :success
  end

  test "should get edit" do
    get edit_finished_products_taxonomy_url(@finished_products_taxonomy)
    assert_response :success
  end

  test "should update finished_products_taxonomy" do
    patch finished_products_taxonomy_url(@finished_products_taxonomy), params: { finished_products_taxonomy: { m_id: @finished_products_taxonomy.m_id, name: @finished_products_taxonomy.name, parent_id: @finished_products_taxonomy.parent_id } }
    assert_redirected_to finished_products_taxonomy_url(@finished_products_taxonomy)
  end

  test "should destroy finished_products_taxonomy" do
    assert_difference('FinishedProductsTaxonomy.count', -1) do
      delete finished_products_taxonomy_url(@finished_products_taxonomy)
    end

    assert_redirected_to finished_products_taxonomies_url
  end
end
