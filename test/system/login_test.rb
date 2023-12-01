require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @user.password = "password123"
    @user.password_confirmation = "password123"
    @user.save!
  end

  test "Confirmed user logs in" do
    visit new_user_session_url

    fill_in "Email", with: @user.email
    fill_in "Password", with: "password123"

    within "#new_user" do
      click_on "Log in"
    end

    assert_text "Signed in successfully."
  end

  test "Unconfirmed user logs in" do
    @user.confirmed_at = nil
    @user.save!

    visit new_user_session_url

    fill_in "Email", with: @user.email
    fill_in "Password", with: "password123"

    within "#new_user" do
      click_on "Log in"
    end

    assert_text "You have to confirm your email address before continuing."
  end
end