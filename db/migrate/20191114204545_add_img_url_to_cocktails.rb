class AddImgUrlToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :img_url, :string
  end
end
