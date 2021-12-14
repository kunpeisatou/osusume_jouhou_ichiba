class Item < ApplicationRecord
   belongs_to :admin_id
   belongs_to :category_id
end
