require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid sign up" do
    get sign_up_path
    assert_no_difference('User.count') do
      post users_path, params: { user: { name: "",
                                         email: "awdaw@awdaw",
                                         password: "123123",
                                         password_confirmation: "321321" } }
    end
    assert_template 'users/new'
  end

  test "Valid sign up" do
    assert_difference('User.count', 1) do
      post users_path, params: {
        user: {
          name: "Dim000n",
          email: "awdaw@awdaw.com",
          password: "123123123",
          password_confirmation: "123123123"
        }
      }
    end
    user = User.last
    assert is_logged_in?
    assert_redirected_to user
  end

end
