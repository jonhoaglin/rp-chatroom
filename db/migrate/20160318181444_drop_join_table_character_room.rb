class DropJoinTableCharacterRoom < ActiveRecord::Migration
  def change
    drop_join_table :characters, :rooms do |t|
      # t.index [:character_id, :room_id]
      # t.index [:room_id, :character_id]
    end
  end
end
