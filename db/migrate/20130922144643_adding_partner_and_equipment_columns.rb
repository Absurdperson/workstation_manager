class AddingPartnerAndEquipmentColumns < ActiveRecord::Migration
  def up
  		add_column :inboxes, :partner_value, :string
		add_column :inboxes, :equipment_value, :string
  end

  def down
  end
end
