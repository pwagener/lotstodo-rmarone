class UsersController < ApplicationController
  def create
    user = User.create!(:name => params[:name])
    render json: user
  end

  def show
    user = User.find(params[:id])
    render json: user
  end
end
