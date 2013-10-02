class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :user_id
      t.integer :partner_id
      t.string :description

      t.timestamps
    end
  end
end
