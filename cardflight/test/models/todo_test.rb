require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "the truth" do
    u = User.create(:name => 'foo')
    new_todo = u.todos.create!({:title => 'foo', :body => 'body'})
  end
end
