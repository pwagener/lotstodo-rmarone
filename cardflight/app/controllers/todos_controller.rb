class TodosController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.todos
  end

  def create
    user = User.find(params[:user_id])
    new_todo = user.todos.create!({:title => params[:title], :body => params[:body]})
    render json: new_todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update_attributes!(:done => params[:done], :body => params[:body])
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy!
    render json: {:destroyed => true}
  end

end
