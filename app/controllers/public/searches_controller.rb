class Public::SearchesController < ApplicationController
 def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
 end


  private
  
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'item'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        Item.where(name: content)
      # 選択した検索方法がが部分一致だったら
      elsif method == 'partial'
        Item.where('name LIKE ?', "%#{content}%")
      elsif method == 'forward'
        Item.where('name LIKE ?', "#{content}%")
      else
        Item.where('name LIKE ?', "%#{content}")
      end
    # 選択したモデルがbookだったら
    elsif model == 'admin'
      if method == 'perfect'
        Admin.where(name: content)
      elsif method == 'partial'
        Admin.where('name LIKE ?', "%#{content}%")
      elsif method == 'forward'
        Admin.where('name LIKE ?', "#{content}%")
      else
        Admin.where('name LIKE ?', "%#{content}") 
      end
    end
  end
end
