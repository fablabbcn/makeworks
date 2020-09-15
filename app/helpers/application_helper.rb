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
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
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
    content_for(:title, page_title.to_s)
    content_tag(:h1, page_title, options.merge(itemprop: 'name'))
  end

  def admin?
    current_user&.is_admin?
  end
end
