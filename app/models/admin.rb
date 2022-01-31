class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  attachment :image
  
  
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
  validates :email, presence: true, uniqueness: true
  
end
