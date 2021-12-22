class Manage::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @item=Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.admin_id = current_admin.id
    if @item.save
      #redirect_to manage_item_path(@item)
      redirect_to manage_items_path
    else
      @item=Item.new
      render :new
    end 
  end
  
  def index
    @items = Item.all
    #@items = Item.page(params[:page]).reverse_order
    @admin = current_admin
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
    @new_item = Item.new
    
  end

  def edit
    @item = Item.find(params[:id])
    if @item.admin == current_admin
      render "edit"
    else
      redirect_to manage_item_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:notice] = 'You have updated item successfully.'
       redirect_to manage_item_path(@item.id)
    else
       render :edit
    end
    
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to manage_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:admin_id, :category_id, :name, :image, :introduction)
  end
end
