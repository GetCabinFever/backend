require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:tycho)
    request.headers["X-Auth-Token"] = @user.auth_token
  end

  test 'should not update other profiles' do
    patch :update, id: users(:brit).id, email: 'foo@bar.com'
    assert_response 401
  end

  test 'should only update own profile' do
    patch :update, id: @user.id, email: 'foo@bar.com'
    assert_not_equal @user.email, User.find(@user.id).email
    assert_response 200
    assert_template 'registrations/create.json.jbuilder'
  end

  test 'should render error when not logged in user destroy' do
    assert_no_difference 'User.count' do
      delete :destroy, id: users(:brit).id
    end
    assert_response 401
  end
end
