class AddFileToCharPictures < ActiveRecord::Migration
  def self.up
    change_table :char_pictures do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :char_pictures, :file
  end
end
