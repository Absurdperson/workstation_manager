class Uploads < ActiveRecord::Migration
  def up
  add_column :inboxes, :letter, :string 
  end

  def down
  remove_column :inboxes, :letter, :string 
  end
end
