class CreateOutboxEquipments < ActiveRecord::Migration
  def change
    create_table :outbox_equipments do |t|

	t.integer :outbox_id
    t.integer :equipment_id
	
      t.timestamps
    end
  end
end
