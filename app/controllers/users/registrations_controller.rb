class Users::RegistrationsController < Devise::RegistrationsController
    invisible_captcha only: [:create] unless Rails.env.test?
end