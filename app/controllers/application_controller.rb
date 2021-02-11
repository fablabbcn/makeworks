class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale
  before_action :set_user_context, if: :current_user
  around_action :set_time_zone, if: :current_user

  def check_if_admin
    redirect_to(:root, flash: { error: "Admin only" }) unless current_user&.is_admin?
  end

  def set_locale
    I18n.locale = current_user&.locale.presence || I18n.default_locale
  end

  def set_time_zone(&block)
    Time.use_zone(current_user&.time_zone, &block)
  end

  private

  def set_user_context
    Sentry.set_user(email: current_user.email, id: current_user.id)
  end
end
