class Public::FavoritesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.new(item_id: item.id)
    favorite.save
    #redirect_to session[:previous_url]
    redirect_back(fallback_location: manage_items_path)
    
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.find_by(item_id: item.id)
    favorite.destroy
    #redirect_to session[:previous_url]
    redirect_back(fallback_location: manage_items_path)
  end
  
end
