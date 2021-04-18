json.extract! blog, :id, :m_id, :blurb, :blog_category_ids, :content, :dont_publish, :featured_video, :header_image, :medium_id, :slug, :sub_title, :title, :created_at, :updated_at
json.url blog_url(blog, format: :json)
