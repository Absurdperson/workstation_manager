class RenameColumnType < ActiveRecord::Migration
  def up
  	rename_column :messages, :type, :letter_type
  end

  def down
  end
end
