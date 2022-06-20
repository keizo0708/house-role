class UsersController < ApplicationController
  def index
    @users = User.all
    @followings = current_user.followings
    @followers = current_user.followers
    @houses = current_user.houses.all
  end

  def show
    @user = User.find(params[:id])
    @houses = @user.houses.all
    @followings = @user.followings
    @followers = @user.followers
  end

  def search
    @users = User.search(params[:keyword])
  end
end
