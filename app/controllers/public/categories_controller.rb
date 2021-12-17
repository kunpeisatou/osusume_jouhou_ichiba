class Public::CategoriesController < ApplicationController
  
  def index
    @categories = Category.page(params[:page]).reverse_order
  end
end
