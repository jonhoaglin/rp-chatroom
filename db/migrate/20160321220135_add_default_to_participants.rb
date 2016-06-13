class AddDefaultToParticipants < ActiveRecord::Migration
  def change
    change_column :participants, :approved, :boolean, default: false
  end
end
