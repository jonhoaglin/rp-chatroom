class AddPrivateToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :private, :boolean
    add_column :rooms, :closed_canon, :boolean
    add_column :rooms, :approval_only, :boolean
  end
end
