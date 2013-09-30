class CreatePartners < ActiveRecord::Migration
	def change
		create_table :partners do |t|
			t.string :name
			t.string :address
			t.integer :user_id
			t.timestamps
			t.string :contact_name
			t.string :contact_phone
			t.string :contact_email
		end
		add_index :partners, [:user_id, :created_at, :name, :address, :contact_name, :contact_email, :contact_phone]
	end
end
