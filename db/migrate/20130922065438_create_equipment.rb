class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :user_id
      t.integer :val
      t.integer :count

      t.timestamps
    end
	add_index :equipment, [:user_id, :created_at, :name]
  end
end
