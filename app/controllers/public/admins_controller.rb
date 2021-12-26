class Public::AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @items = @admin.items.page(params[:page]).reverse_order
  end
end
