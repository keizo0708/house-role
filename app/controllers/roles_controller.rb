class RolesController < ApplicationController
  def index
    @house = House.find(params[:house_id])
    @roles = @house.roles.order("created_at ASC")

    @role = Role.new
    gon.house_id = @house.id
  end
  
  def new
    @house = House.find(params[:house_id])
    @role = Role.new
  end

  def create
    @house = House.find(params[:house_id])
    post = @house.roles.create(role_params)
    category = post.category.name
    render json:{ post: post, category: category }
    #if @role.save
    #  redirect_to root_path
    #else
    #  render :new
    #end
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
