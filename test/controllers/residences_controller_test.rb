require 'test_helper'

class ResidencesControllerTest < ActionController::TestCase

  setup do
    @residence = residences(:cabin)
    @user = users(:tycho)
    request.headers['X-Auth-Token'] = @user.auth_token
  end

  test 'should get index residence' do
    get :index
    assert_template 'index.json.jbuilder'
    assert_response 200
    assert_not_nil assigns(:residences)
  end

  test 'should get show residence' do
    get :show, id: @residence.id
    assert_template 'show.json.jbuilder'
    assert_response 200
  end

  test 'non logged in user should not create residence' do
      request.headers['X-Auth-Token'] = nil
      post :create, residence: { title: 'Mountain Overlook' }
      assert_response 401
  end

  # test 'should error create residence with invalid params' do
  #     post :create, id: @residence.id, residence: { title: nil }
  #     assert_not @residence.valid?
  #     assert_response 422
  # end
end
