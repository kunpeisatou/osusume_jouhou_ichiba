class Manage::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    #@genres = Genre.all
    @categories = Category.page(params[:page]).reverse_order
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'You have created category successfully.'
      redirect_to manage_categories_path
    else
      @categories = Category.all
      render :index
    end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       flash[:notice] = 'You have updated category successfully.'
       redirect_to manage_categories_path
    else
       render :edit
    end
    
  end

  # 投稿データのストロングパラメータ
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
