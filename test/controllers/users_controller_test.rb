require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in users(:one)
  end

  test "should get index" do
    skip
    get users_url
    assert_response :success
  end

  test "should get new" do
    skip
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    skip
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, first_name: @user.first_name, is_admin: @user.is_admin, last_name: @user.last_name, m_id: @user.m_id } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    skip
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, is_admin: @user.is_admin, last_name: @user.last_name, m_id: @user.m_id } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    skip
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
