class Item < ApplicationRecord
   belongs_to :admin
   belongs_to :category
   attachment :image
   
   has_many :favorites, dependent: :destroy
   has_many :favorite_customers, through: :favorites, source: :customer

   def favorited_by?(customer)
     favorites.where(customer_id: customer.id).exists?
   end
   
   #検索機能の為のメソッド　ここから
   def self.search(content, method)
      if method == 'perfect'
      where(name: content)
      elsif method == 'partial'
      where('name LIKE ?', "%#{content}%")
      elsif method == 'forward'
      where('name LIKE ?', "#{content}%")
      else
      where('name LIKE ?', "%#{content}")
      end
   end
   #検索機能の為のメソッド　ここまで
   
   validates :name, presence: true
   validates :introduction, presence: true
   validates :category_id, presence: true
end
