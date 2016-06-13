class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :character, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
