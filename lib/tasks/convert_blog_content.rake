namespace :makeworks do
  include ActionView::Helpers::TextHelper

  desc "Converts the .content column into ActionText supported column"
  task convert_content: [:environment] do
    Blog.all.each do |blog|
      blog.update_attribute(:content_action, simple_format(blog.content))
    end
  end
end
