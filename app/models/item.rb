class Item < ApplicationRecord
   belongs_to :admin
   belongs_to :category
   attachment :image
   
   validates :name, presence: true
   validates :introduction, presence: true
   validates :category_id, presence: true
end
