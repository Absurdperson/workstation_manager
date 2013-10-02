class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :user_id
      t.integer :partner_id
      t.string :description

      t.timestamps
    end
  end
end
