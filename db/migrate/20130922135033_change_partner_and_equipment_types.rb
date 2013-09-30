class ChangePartnerAndEquipmentTypes < ActiveRecord::Migration
  def up
	change_column :inboxes, :partner_id, :string
	change_column :inboxes, :equipment_id, :string
  end

  def down
	change_column :inboxes, :partner_id, :integer
	change_column :inboxes, :equipment_id, :integer
  end
end
