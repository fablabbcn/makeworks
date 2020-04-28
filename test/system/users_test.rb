require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "visiting the index" do
    skip
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    skip
    visit users_url
    click_on "New User"

    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    check "Is admin" if @user.is_admin
    fill_in "Last name", with: @user.last_name
    fill_in "M", with: @user.m_id
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    #visit users_url
    visit edit_profile_url @user.id

    fill_in "Email", with: @user.email
    fill_in "First name", with: 'NewName'
    #check "Is admin" if @user.is_admin
    fill_in "Last name", with: 'NewLastName'
    #fill_in "M", with: @user.m_id
    click_on "Update User"

    assert_text "User was successfully updated"
  end

  test "destroying a User" do
    skip
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
