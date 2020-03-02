require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  setup do
    @blog = blogs(:one)
  end

  test "visiting the index" do
    visit blogs_url
    assert_selector "h1", text: "Blogs"
  end

  test "creating a Blog" do
    visit blogs_url
    click_on "New Blog"

    fill_in "Blog category", with: @blog.blog_category_id
    fill_in "Blurb", with: @blog.blurb
    fill_in "Content", with: @blog.content
    check "Dont publish" if @blog.dont_publish
    fill_in "Featured video", with: @blog.featured_video
    fill_in "Header image", with: @blog.header_image
    fill_in "M", with: @blog.m_id
    fill_in "Medium", with: @blog.medium_id
    fill_in "Slug", with: @blog.slug
    fill_in "Sub title", with: @blog.sub_title
    fill_in "Title", with: @blog.title
    click_on "Create Blog"

    assert_text "Blog was successfully created"
    click_on "Back"
  end

  test "updating a Blog" do
    visit blogs_url
    click_on "Edit", match: :first

    fill_in "Blog category", with: @blog.blog_category_id
    fill_in "Blurb", with: @blog.blurb
    fill_in "Content", with: @blog.content
    check "Dont publish" if @blog.dont_publish
    fill_in "Featured video", with: @blog.featured_video
    fill_in "Header image", with: @blog.header_image
    fill_in "M", with: @blog.m_id
    fill_in "Medium", with: @blog.medium_id
    fill_in "Slug", with: @blog.slug
    fill_in "Sub title", with: @blog.sub_title
    fill_in "Title", with: @blog.title
    click_on "Update Blog"

    assert_text "Blog was successfully updated"
    click_on "Back"
  end

  test "destroying a Blog" do
    visit blogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blog was successfully destroyed"
  end
end
