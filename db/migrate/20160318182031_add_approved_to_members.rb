class AddApprovedToMembers < ActiveRecord::Migration
  def change
    add_column :members, :approved, :boolean
  end
end
