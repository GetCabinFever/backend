require 'test_helper'

class GuestBooksControllerTest < ActionController::TestCase
  setup do
    @guest_book = guest_books(:summer)
  end

  # test 'creating should error when not logged in' do
  #   assert_no_difference 'GuestBook.count' do
  #     post :create, guest_book: { entry: 'Foobar' }
  #   end
  #   assert_response 401
  # end

  # test 'destroying should error when not logged in' do
  #   assert_no_difference 'GuestBook.count' do
  #     delete :destroy, id: @guest_book
  #   end
  #   assert_response 401
  # end
end
