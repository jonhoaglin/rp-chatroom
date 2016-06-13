class RemoveTypeFromCharPictures < ActiveRecord::Migration
  def change
    remove_column :char_pictures, :type, :string
  end
end
