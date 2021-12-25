class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :item, uniqueness: { scope: :customer }
  
end
