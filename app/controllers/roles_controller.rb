class RolesController < ApplicationController
  def index
    @house = House.find(params[:house_id])
    @roles = @house.roles.order("created_at ASC")
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

  def destroy
    @house = House.find(params[:house_id])
    @role = @house.roles.find(params[:id])
    if @role.destroy
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def role_params
    params.require(:role).permit(:content, :category_id)
  end
end
