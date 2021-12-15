class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # if
    @item.save
    redirect_to admin_item_path(@item)
    # else
    #   redirect_to request.referer,notice:"新規登録できませんでした"
    # end 
  end
  
  def index
    #@post_images = PostImage.allを削除。左記の場合全ての画像を表示してしまうため。
    #@books = Item.page(params[:page]).reverse_order
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
      redirect_to admin_item_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:notice] = 'You have updated item successfully.'
       redirect_to admin_item_path(@book.id)
    else
       render :edit
    end
    
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:admin_id, :category_id, :name, :image, :price, :introduction)
  end
end
