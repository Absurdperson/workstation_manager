class AddNewColumnToPartners < ActiveRecord::Migration
  def up
  	add_column :partners, :contact_date, :string
  	add_column :partners, :type_of_activity, :string
  end

  def down
  end
end
