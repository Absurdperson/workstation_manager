class AddEquipmentIdToInbox < ActiveRecord::Migration
  def up
  		add_column :equipment, :inbox_id, :integer
  end

  def down
		remove_column :equipment, :inbox_id, :integer
  end
end
