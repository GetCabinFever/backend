require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase

  test 'should create user ' do
    assert_difference 'User.count' do
      post :create, {
        first_name: 'Tycho',
        email: "cookies@mons.com",
        password: "deeeelicious"
      }
    end
    assert_equal response.status, 200
  end

  test 'should not create user with invalid email' do
    post :create, { email: 'void.com' }
    assert_equal response.status, 422
    assert_not_nil assigns(:user)
  end

  # test 'should not create user with invalid password' do
  #   post :create, { password: 'void' }
  #   assert_equal response.status, 422
  # end

  test 'should log in' do
    post :login, {
      email: users(:tycho).email,
      password: 'tbrahe'
    }
    assert_response 200
  end

  test 'should not log in with invalid password' do
    post :login, {
      email: users(:tycho).email,
      password: 'void'
    }
    assert_response 401
  end
end
