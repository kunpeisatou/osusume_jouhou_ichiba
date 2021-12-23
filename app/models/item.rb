class Item < ApplicationRecord
   belongs_to :admin
   belongs_to :category
   attachment :image
   
   has_many :favorites, dependent: :destroy

   def favorited_by?(customer)
     favorites.where(customer_id: customer.id).exists?
   end
   
   validates :name, presence: true
   validates :introduction, presence: true
   validates :category_id, presence: true
end
