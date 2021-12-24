class Public::CategoriesController < ApplicationController
  
  def index
    @categories = Category.page(params[:page]).reverse_order
    @items = Item.order('id DESC').limit(5)
  end
  
  def show
    @category = Category.find(params[:id])
  end
end
