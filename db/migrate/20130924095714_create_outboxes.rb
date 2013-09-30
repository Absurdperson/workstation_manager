class CreateOutboxes < ActiveRecord::Migration
  def change
    create_table :outboxes do |t|
      t.string :theme
      t.integer :user_id
      t.string :partner_id
      t.string :equipment_id
      t.string :inbox_id

      t.timestamps
    end
  end
end
