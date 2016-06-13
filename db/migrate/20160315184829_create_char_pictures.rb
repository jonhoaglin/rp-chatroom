class CreateCharPictures < ActiveRecord::Migration
  def change
    create_table :char_pictures do |t|
      t.string :location
      t.string :type
      t.references :character, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
