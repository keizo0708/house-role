class UsersController < ApplicationController
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
