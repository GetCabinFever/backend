require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:tycho)
    request.headers["X-Auth-Token"] = @user.auth_token
  end

  # test "users can't update other users" do
  #   patch :update, id: users(:brit).id, email: "ur-hacked@haha.com"
  #   assert_response :unauthorized
  # end
  #
  # test "fake users cannot be updated" do
  #   patch :update, id: 9999999, email: "bull@shit.com"
  #   assert_response :not_found
  # end

  test "only logged in users can update themselves" do
    patch :update, id: @user.id, email: "foo@bar.com"
    assert_not_equal @user.email, User.find(@user.id).email
    assert_response :success
    assert_template "update.json.jbuilder"
  end
end
