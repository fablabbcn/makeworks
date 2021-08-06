require 'test_helper'

class MachinesTaxonomiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machines_taxonomy = machines_taxonomies(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get machines_taxonomies_url
    assert_response :success
  end

  test "should get new" do
    get new_machines_taxonomy_url
    assert_response :success
  end

  test "should create machines_taxonomy" do
    assert_difference('MachinesTaxonomy.count') do
      post machines_taxonomies_url, params: { machines_taxonomy: { m_id: @machines_taxonomy.m_id, name: @machines_taxonomy.name, parent_id: @machines_taxonomy.parent_id } }
    end

    assert_redirected_to machines_taxonomy_url(MachinesTaxonomy.unscoped.last)
  end

  test "should show machines_taxonomy" do
    get machines_taxonomy_url(@machines_taxonomy)
    assert_response :success
  end

  test "should get edit" do
    get edit_machines_taxonomy_url(@machines_taxonomy)
    assert_response :success
  end

  test "should update machines_taxonomy" do
    patch machines_taxonomy_url(@machines_taxonomy), params: { machines_taxonomy: { m_id: @machines_taxonomy.m_id, name: @machines_taxonomy.name, parent_id: @machines_taxonomy.parent_id } }
    assert_redirected_to machines_taxonomy_url(@machines_taxonomy.name.downcase)
  end

  test "should destroy machines_taxonomy" do
    assert_difference('MachinesTaxonomy.count', -1) do
      delete machines_taxonomy_url(@machines_taxonomy)
    end

    assert_redirected_to machines_taxonomies_url
  end
end
