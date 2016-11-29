require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "create a new user" do
    post :create, {:name => 'test1'}
    assert User.find_by(name:'test1')
    json_user = JSON.parse(@response.body)
    assert_equal 'test1', json_user['name']
  end

  test "retrieve a user" do
    u = User.create!(:name => 'test2')
    get :show, {:id => u.id}
    json_user = JSON.parse(@response.body)
    assert_equal 'test2', json_user['name']
  end
end
