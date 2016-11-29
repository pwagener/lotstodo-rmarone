require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @user = User.create! :name => 'todos_man'
  end

  test "can add a todo to a user" do
    post :create, {:user_id => @user.id, :title => 'title', :body => 'body'}
    json_todo = JSON.parse(@response.body)
    assert_equal 'title', json_todo['title']
    assert_equal nil, json_todo['done']
  end

  test "retrieve a set of todos" do
    @user.todos.create(:title => 'first title')
    @user.todos.create(:title => 'second title')
    get :index, {:user_id => @user.id}
    json_todos = JSON.parse(@response.body)
    assert_equal 'first title', json_todos[0]['title']
    assert_equal 'second title', json_todos[1]['title']
  end

  test 'set a todo to done' do
    existing_todo = @user.todos.create!(:title => 'finish him')
    put :update, {:id => existing_todo.id, :user_id => @user.id, :done => true}
    json_todo = JSON.parse(@response.body)
    assert_equal true, json_todo['done']
  end

  test 'update text in a todo' do
    existing_todo = @user.todos.create!(:title => 'change him', :body => 'original body')
    put :update, {:id => existing_todo.id, :user_id => @user.id, :body => 'new text'}
    json_todo = JSON.parse(@response.body)
    assert_equal 'new text', json_todo['body']
    assert_equal 'change him', json_todo['title']
    assert_equal nil, json_todo['done']
  end

  test 'remove a todo' do
    existing_todo = @user.todos.create!(:title => 'to be destroyed')
    delete :destroy, {:id => existing_todo.id, :user_id => @user.id}
  end
end
