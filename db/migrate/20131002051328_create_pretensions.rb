class CreatePretensions < ActiveRecord::Migration
  def change
    create_table :pretensions do |t|
      t.string :user_id
      t.integer :partner_id
      t.string :description

      t.timestamps
    end
  end
end
