class Admin::ItemsController < ApplicationController
  def index
    #@post_images = PostImage.allを削除。左記の場合全ての画像を表示してしまうため。
    #@books = Item.page(params[:page]).reverse_order
    @admin = current_admin
    @book = Item.new
  end
end
