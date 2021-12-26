class AddIntroductionToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :introduction, :text
  end
end
