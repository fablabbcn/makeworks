class ApplicationController < ActionController::Base

  def my_admin_required!
    redirect_to new_user_session_path unless current_user.is_admin?
  end
end
