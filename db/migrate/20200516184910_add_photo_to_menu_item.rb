class AddPhotoToMenuItem < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :photo, :string
  end
end
