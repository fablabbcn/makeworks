require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase
  test "Signing up" do
    logout
    visit new_user_registration_url

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password123", match: :prefer_exact
    fill_in "Password confirmation", with: "password123"

    click_on "Get Started"

    assert_text "A message with a confirmation link has been sent to your email address."

    user = User.last
    assert_equal user.email, "user@example.com"

    visit user_confirmation_url(confirmation_token: user.confirmation_token)
    assert_text "Your email address has been successfully confirmed."
  end
end