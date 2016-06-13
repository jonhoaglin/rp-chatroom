class AddDetailsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :age, :string
    add_column :characters, :gender, :string
    add_column :characters, :location, :string
    add_column :characters, :occupation, :string
    add_column :characters, :height, :string
    add_column :characters, :weight, :string
    add_column :characters, :likes, :text
    add_column :characters, :dislikes, :text
    add_column :characters, :interests, :text
    add_column :characters, :personality, :text
    add_column :characters, :history, :text
    add_column :characters, :description, :text
    add_column :characters, :misc, :text
    add_column :characters, :abilities, :text
    add_column :characters, :weaknesses, :text
  end
end
