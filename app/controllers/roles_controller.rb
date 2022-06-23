class RolesController < ApplicationController
  before_action :set_house, only: [:index, :new, :create, :destroy]

  def index
    @roles = @house.roles.order("created_at ASC")
    @role = Role.new
    gon.house_id = @house.id
  end
  
  def new
    @role = Role.new
  end

  def create
    post = @house.roles.create(role_params)
    category = post.category.name
    render json:{ post: post, category: category }
  end

  def destroy
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

  def set_house
    @house = House.find(params[:house_id])
  end
end
