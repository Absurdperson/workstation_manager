class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :description
      t.string :partner_id
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
