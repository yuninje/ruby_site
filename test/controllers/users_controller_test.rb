require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get users_login_url
    assert_response :success
  end

  test "should get signUp" do
    get users_signUp_url
    assert_response :success
  end

  test "should get logout" do
    get users_logout_url
    assert_response :success
  end

  test "should get signIn" do
    get users_signIn_url
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

end
