require 'test_helper'

class ResidenceTest < ActiveSupport::TestCase

  test 'should belong to user' do
    residences(:cabin).respond_to?(:tycho)
  end

  test 'should have many guest books' do
    residence = residences(:cabin)

    assert residence.guest_books.count >= 0
    assert_equal residence.guest_books.first, guest_books(:summer)
  end
end
