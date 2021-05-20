module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message,
                         class: "alert #{bootstrap_class_for(msg_type)} position-fixed shadow px-4 w-25 mt-3",
                         role: "alert",
                         style: 'z-index:200; right:5%; opacity: 0.8;'
                        ) do
        concat content_tag(:button, 'x', class: "btn-close", data: { 'bs-dismiss': 'alert' })
        concat message
      end)
    end
    nil
  end

  def locale_name_pairs
    I18n.available_locales.map do |locale|
      [I18n.t('name', locale: locale), locale.to_s]
    end
  end

  def title(page_title, options = {})
    content_for(:title, page_title.to_s.html_safe)
    content_tag(:h1, page_title, options.merge(itemprop: 'name'))
  end

  def admin?
    current_user&.is_admin?
  end

  def get_940px(the_url)
    comp_name = the_url.split('/')[-2]
    the_url.gsub(comp_name.to_s, "#{comp_name}/940px")
  end

  # We can use this if we want to check if URL exists.
  # For example to check if an image exists in S3
  def link_exists?(url)
    uri = URI(url)

    request = Net::HTTP.new uri.host
    response = request.request_head uri.path
    response.code.to_i == 200
  end

  def get_1200px(the_url)
    # Use a default image if the_url is empty.
    return 'https://via.placeholder.com/300x200' if the_url.blank?
    # Don't try to change URLs without multiple slashes /
    return the_url if the_url.count('/') < 3

    # The old website saved all images in MULTIPLE sizes
    # The original, and then in 3 different folders:
    # https://static.make.works/company/BroadWorkshop/191115_BroadWorkshop_4.jpg
    # https://static.make.works/company/BroadWorkshop/460px/191115_BroadWorkshop_4.jpg
    # https://static.make.works/company/BroadWorkshop/940px/191115_BroadWorkshop_4.jpg
    # https://static.make.works/company/BroadWorkshop/1200px/191115_BroadWorkshop_4.jpg

    # Find the starting point of company name
    pos = the_url.index(the_url.split('/')[-1])
    # Insert the 1200px to a duplicate of the string, so we don't accidentally modify the original one
    the_url.dup.insert(pos, '1200px/')
  end
end
