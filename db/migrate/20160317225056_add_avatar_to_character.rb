class AddAvatarToCharacter < ActiveRecord::Migration
  def self.up
    change_table :characters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :characters, :avatar
  end
end
