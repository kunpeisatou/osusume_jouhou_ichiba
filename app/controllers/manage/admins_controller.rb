class Manage::AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  
  def index
    @admins = Admin.all.page(params[:page]).reverse_order
  end
  
  def show
    @admin = Admin.find(params[:id])
    @items = @admin.items.page(params[:page]).reverse_order 
  end 
  
  def edit
    @admin = Admin.find(params[:id])
  end 
  
  def update
     @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to manage_root_path
    else
      render :edit
    end
  end 
  
    
   private

  def admin_params
    params.require(:admin).permit(:name, :image, :introduction)
  end
end

