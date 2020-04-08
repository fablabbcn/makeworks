require 'test_helper'

class MaterialsTaxonomiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @materials_taxonomy = materials_taxonomies(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get materials_taxonomies_url
    assert_response :success
  end

  test "should get new" do
    get new_materials_taxonomy_url
    assert_response :success
  end

  test "should create materials_taxonomy" do
    assert_difference('MaterialsTaxonomy.count') do
      post materials_taxonomies_url, params: { materials_taxonomy: { m_id: @materials_taxonomy.m_id, name: @materials_taxonomy.name, parent_id: @materials_taxonomy.parent_id } }
    end

    assert_redirected_to materials_taxonomy_url(MaterialsTaxonomy.last)
  end

  test "should show materials_taxonomy" do
    get materials_taxonomy_url(@materials_taxonomy)
    assert_response :success
  end

  test "should get edit" do
    get edit_materials_taxonomy_url(@materials_taxonomy)
    assert_response :success
  end

  test "should update materials_taxonomy" do
    patch materials_taxonomy_url(@materials_taxonomy), params: { materials_taxonomy: { m_id: @materials_taxonomy.m_id, name: @materials_taxonomy.name, parent_id: @materials_taxonomy.parent_id } }
    assert_redirected_to materials_taxonomy_url(@materials_taxonomy)
  end

  test "should destroy materials_taxonomy" do
    assert_difference('MaterialsTaxonomy.count', -1) do
      delete materials_taxonomy_url(@materials_taxonomy)
    end

    assert_redirected_to materials_taxonomies_url
  end
end
