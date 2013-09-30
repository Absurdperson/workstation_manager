class CreateInboxEquipments < ActiveRecord::Migration
  def change
    create_table :inbox_equipments do |t|
      t.integer :inbox_id
      t.integer :equipments_id

      t.timestamps
    end
  end
end
