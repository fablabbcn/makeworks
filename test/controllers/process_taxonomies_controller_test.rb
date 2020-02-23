require 'test_helper'

class ProcessTaxonomiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @process_taxonomy = process_taxonomies(:one)
  end

  test "should get index" do
    get process_taxonomies_url
    assert_response :success
  end

  test "should get new" do
    get new_process_taxonomy_url
    assert_response :success
  end

  test "should create process_taxonomy" do
    assert_difference('ProcessTaxonomy.count') do
      post process_taxonomies_url, params: { process_taxonomy: { m_id: @process_taxonomy.m_id, name: @process_taxonomy.name, parent_id: @process_taxonomy.parent_id } }
    end

    assert_redirected_to process_taxonomy_url(ProcessTaxonomy.last)
  end

  test "should show process_taxonomy" do
    get process_taxonomy_url(@process_taxonomy)
    assert_response :success
  end

  test "should get edit" do
    get edit_process_taxonomy_url(@process_taxonomy)
    assert_response :success
  end

  test "should update process_taxonomy" do
    patch process_taxonomy_url(@process_taxonomy), params: { process_taxonomy: { m_id: @process_taxonomy.m_id, name: @process_taxonomy.name, parent_id: @process_taxonomy.parent_id } }
    assert_redirected_to process_taxonomy_url(@process_taxonomy)
  end

  test "should destroy process_taxonomy" do
    assert_difference('ProcessTaxonomy.count', -1) do
      delete process_taxonomy_url(@process_taxonomy)
    end

    assert_redirected_to process_taxonomies_url
  end
end
