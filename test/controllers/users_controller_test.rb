require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:tycho)
  end

  teardown do
    @user.destroy!
  end

  # test 'should successfully update user' do
  #   updated_email = 'tycho@domain.com'
  #
  #   patch :update, id: @user.id, user: { email: updated_email }
  #   assert_equal updated_email, @user.email
  #   assert_response 200
  # end
end
