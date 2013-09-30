class AddColumns < ActiveRecord::Migration
  def up
	add_column :partners, :bin, :string
	add_column :partners, :director, :string
	
	add_column :equipment, :description, :integer
	add_attachment :equipment, :photo
  end

  def down
  end
end
