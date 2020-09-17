class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def fablabs
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def linkedin
    p '-----------'
    p request.env['omniauth']
    p '--'
    p request.env['omniauth.auth']
    p '-- info:'
    p request.env['omniauth.auth'].info
    p '-- email:'
    p request.env['omniauth.auth'].info.email
    p request.env['omniauth.auth'].info.first_name
    p request.env['omniauth.auth'].info.last_name
    p request.env['omniauth.auth'].info.picture_url

    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end
end
