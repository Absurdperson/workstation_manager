class RenameEquipmentsId < ActiveRecord::Migration
  def up
	rename_column :inbox_equipments, :equipments_id, :equipment_id
  end

  def down
  end
end
