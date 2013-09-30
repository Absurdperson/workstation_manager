class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.string :theme
      t.integer :user_id
      t.integer :partner_id
      t.integer :equipment_id

      t.timestamps
    end
	add_index :inboxes, [:user_id, :created_at, :theme]
  end
end
