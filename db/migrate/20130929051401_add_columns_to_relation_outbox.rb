class AddColumnsToRelationOutbox < ActiveRecord::Migration
  def up
  	change_column :outboxes, :equipment_id, :integer
  	change_column :outboxes, :partner_id, :integer
	
	add_column :partners, :outbox_id, :integer
	add_column :equipment, :outbox_id, :integer
  end

  def down
	change_column :outboxes, :equipment_id, :string
	change_column :outboxes, :partner_id, :string
	
	remove_column :partners, :outbox_id, :integer
	remove_column :equipment, :outbox_id, :integer
  end
end
