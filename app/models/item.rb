class Item < ApplicationRecord
   belongs_to :admin
   belongs_to :category
   attachment :image
end
