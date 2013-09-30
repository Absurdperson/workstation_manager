class ChangeEquipmentsIdTypeInInboxes < ActiveRecord::Migration
  def up
  	change_column :inboxes, :equipment_id, :integer
  end

  def down
   	change_column :inboxes, :equipment_id, :string
  end
end
