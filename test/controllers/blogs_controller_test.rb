require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_url
    assert_response :success
  end

  test "should create blog" do
    assert_difference('Blog.count') do
      post blogs_url, params: { blog: { blog_category_id: @blog.blog_category_id, blurb: @blog.blurb, content: @blog.content, dont_publish: @blog.dont_publish, featured_video: @blog.featured_video, header_image: @blog.header_image, m_id: @blog.m_id, medium_id: @blog.medium_id, slug: @blog.slug, sub_title: @blog.sub_title, title: @blog.title } }
    end

    assert_redirected_to blog_url(Blog.last)
  end

  test "should show blog" do
    get blog_url(@blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch blog_url(@blog), params: { blog: { blog_category_id: @blog.blog_category_id, blurb: @blog.blurb, content: @blog.content, dont_publish: @blog.dont_publish, featured_video: @blog.featured_video, header_image: @blog.header_image, m_id: @blog.m_id, medium_id: @blog.medium_id, slug: @blog.slug, sub_title: @blog.sub_title, title: @blog.title } }
    assert_redirected_to blog_url(@blog)
  end

  test "should destroy blog" do
    assert_difference('Blog.count', -1) do
      delete blog_url(@blog)
    end

    assert_redirected_to blogs_url
  end
end
