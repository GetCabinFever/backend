require 'test_helper'

class GuestBooksControllerTest < ActionController::TestCase
  setup do
    @guest_book = guest_books(:summer)
  end

  test 'create should error when not logged in' do
    assert_no_difference 'GuestBook.count' do
      post :create, guest_book: { entry: 'Foobar' }
    end
    assert_response 401
  end

  test 'destroy should error when not logged in' do
    assert_no_difference 'GuestBook.count' do
      delete :destroy, id: @guest_book
    end
    assert_response 401
  end

  test 'should only update own guest book entry' do
    @user = users(:tycho)
    request.headers['X-Auth-Token'] = @user.auth_token
    patch :update, id: @guest_book.id, entry: 'Rad!'
    assert_response 202
    assert_template 'create.json.jbuilder'
  end

  test 'should not delete other guest book entries' do
    @user = users(:brit)
    assert_no_difference 'GuestBook.count' do
      delete :destroy, id: @guest_book.id
    end
    assert_response 401
  end
end
