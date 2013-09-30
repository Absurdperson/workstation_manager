class ChangeDescriptionType < ActiveRecord::Migration
  def up
  	change_column :equipment, :description, :string
  end

  def down
  end
end
