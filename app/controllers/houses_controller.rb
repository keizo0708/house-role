class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @houses = House.all
    @users = User.all
    @user = current_user
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def join
    @house = House.find(params[:house_id])
    @house.users << current_user
    redirect_to request.referer
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.owner_id = current_user.id
    @house.users << current_user
    if @house.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end 
  end

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end 
  end

  def destroy
    @house = House.find(params[:id])
    @house.users.destroy(current_user)
    redirect_to request.referer
  end

  def all_destroy
    @house = House.find(params[:house_id])
    if @house.destroy
      redirect_to request.referer
    end
  end

  private

  def house_params
    params.require(:house).permit(:name, :house_introduction)
  end

  def ensure_correct_user
    @house = House.find(params[:id])
    unless @house.owner_id == current_user.id
      redirect_to action: :index
    end
  end

end
