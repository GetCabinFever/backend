require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'password should be encrypted' do
    password = 'void'
    @user = User.new(email: 'tbrah@domain.com',
                     password: password)
    @user.save
    assert_not_nil @user.password_digest
    assert_not_equal password, @user.password_digest
  end

  test 'should not save article without password' do
    user = User.new
    assert_not user.save, 'Saved the user without a password'
  end

  test 'should not save invalid email' do
    @user = User.new(email: 'the void',
                     password: 'tbrahe')
    assert_not @user.save, 'Saved the user with invalid email format'
  end

  # test 'email addresses should be unique' do
  #   assert_equal 'tbrahe@domain.com', users(:tycho).email
  #   assert_not_equal users(:tycho).save
  # end

  test 'should have many residences' do
    assert users(:tycho).residences.count >= 0
    assert_equal users(:tycho).residences.first, residences(:cabin)
  end

  test 'should have many guest books' do
    assert users(:tycho).guest_books.count >= 0
    assert_equal users(:tycho).guest_books.first, guest_books(:summer)
  end
end
