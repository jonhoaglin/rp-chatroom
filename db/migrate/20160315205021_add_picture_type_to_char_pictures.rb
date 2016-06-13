class AddPictureTypeToCharPictures < ActiveRecord::Migration
  def change
    add_reference :char_pictures, :picture_type, index: true, foreign_key: true
  end
end
