class Public::CategoriesController < ApplicationController
  
  def index
    @categories = Category.page(params[:page]).reverse_order
  end
  
  def show
    @category = Category.find(params[:id])
  end
end
