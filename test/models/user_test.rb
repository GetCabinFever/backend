require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new first_name: 'Sample User', email: 'sample@domain.com'
  end

  test 'should be valid' do
    assert @user.valid?
  end
end
