require 'test_helper'

class ResidencesControllerTest < ActionController::TestCase

  setup do
    @residence = residences(:cabin)
  end

  test 'should get index' do
    get :index
    assert_template 'index.json.jbuilder'
    assert_response 200
  end

  # test 'should get show' do
  #   get :show, id: @residence
  #   assert_template 'show.json.jbuilder'
  #   assert_response 200
  # end
end
