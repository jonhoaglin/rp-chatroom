class RemoveAvatarFromCharacter < ActiveRecord::Migration
  def change
    remove_column :characters, :avatar, :string
  end
end
