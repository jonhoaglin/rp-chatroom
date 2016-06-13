class RemoveLocationFromCharPictures < ActiveRecord::Migration
  def change
    remove_column :char_pictures, :location, :string
  end
end
