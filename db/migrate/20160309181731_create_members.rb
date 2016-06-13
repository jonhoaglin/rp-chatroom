class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :level
      t.references :user
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
