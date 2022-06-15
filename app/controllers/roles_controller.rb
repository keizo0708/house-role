class RolesController < ApplicationController
  def index
    @house = House.find(params[:house_id])
    @roles = Role.order("created_at DESC")
  end
  
  def new
    @house = House.find(params[:house_id])
    @role = Role.new
  end

  def create
    @house = House.find(params[:house_id])
    @role = @house.roles.new(role_params)
    if @role.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def role_params
    params.require(:role).permit(:title, :content, :category_id)
  end
end
