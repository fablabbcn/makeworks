require 'test_helper'

class ManufacturerTaxonomiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manufacturer_taxonomy = manufacturer_taxonomies(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get manufacturer_taxonomies_url
    assert_response :success
  end

  test "should get new" do
    get new_manufacturer_taxonomy_url
    assert_response :success
  end

  test "should create manufacturer_taxonomy" do
    assert_difference('ManufacturerTaxonomy.count') do
      post manufacturer_taxonomies_url, params: { manufacturer_taxonomy: { m_id: @manufacturer_taxonomy.m_id, name: @manufacturer_taxonomy.name, parent_id: @manufacturer_taxonomy.parent_id } }
    end

    assert_redirected_to manufacturer_taxonomy_url(ManufacturerTaxonomy.unscoped.last)
  end

  test "should show manufacturer_taxonomy" do
    get manufacturer_taxonomy_url(@manufacturer_taxonomy)
    assert_response :success
  end

  test "should get edit" do
    get edit_manufacturer_taxonomy_url(@manufacturer_taxonomy)
    assert_response :success
  end

  test "should update manufacturer_taxonomy" do
    patch manufacturer_taxonomy_url(@manufacturer_taxonomy), params: { manufacturer_taxonomy: { m_id: @manufacturer_taxonomy.m_id, name: @manufacturer_taxonomy.name, parent_id: @manufacturer_taxonomy.parent_id } }
    assert_redirected_to manufacturer_taxonomy_url(@manufacturer_taxonomy)
  end

  test "should destroy manufacturer_taxonomy" do
    assert_difference('ManufacturerTaxonomy.count', -1) do
      delete manufacturer_taxonomy_url(@manufacturer_taxonomy)
    end

    assert_redirected_to manufacturer_taxonomies_url
  end
end
