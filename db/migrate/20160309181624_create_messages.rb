class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :room, index: true, foreign_key: true
      t.references :speaker, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
