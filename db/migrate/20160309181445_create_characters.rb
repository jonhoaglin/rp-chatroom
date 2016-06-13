class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :avatar
      t.string :text_color
      t.references :user, index: true, foreign_key: true
      t.references :universe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
