require 'test_helper'

class RegistrationsControllerTest < ActiveSupport::TestCase
  def setup
    @user = User.new
  end

  def valid_params
    { first_name: 'Johannes', last_name: 'Kepler', password: 'jkepler', auth_token: '2c168ca8d5c11e622a267fb7a67a7d44', email: 'jkepler@domain.com' }
  end

  it 'should be valid' do
    @user.valid?
  end

  it "is valid with valid params" do
    user = User.new valid_params

    assert user.valid?, "Can't create with valid params: #{user.errors.messages}"
  end

  it 'is invalid without an email' do
    params = valid_params.clone
    params.delete :email
    user = User.new params

    user.wont_be :valid?
    user.errors[:email].must_be :present?
  end
end
