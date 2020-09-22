ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Regions" do
          ul do
            Region.last(20).reverse.map do |item|
              li link_to(item.name, admin_region_path(item))
            end
          end
        end
      end
       column do
        panel "Last 20 Companies created" do
          ul do
            Company.last(20).reverse.map do |item|
              li link_to(item.name, admin_company_path(item))
            end
          end
        end
      end
      column do
        panel "Last 20 Users" do
          ul do
            User.last(20).reverse.map do |item|
              li link_to(item.email, admin_user_path(item))
            end
          end
        end
      end
      column do
        panel "Last 20 Blog Posts" do
          ul do
            Blog.last(20).reverse.map do |post|
              li link_to(post.title, admin_blog_path(post))
            end
          end
        end
      end
    end
  end
end
