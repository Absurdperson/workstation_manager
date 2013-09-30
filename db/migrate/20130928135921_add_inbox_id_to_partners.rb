class AddInboxIdToPartners < ActiveRecord::Migration
  def up
  		add_column :partners, :inbox_id, :integer
  end

  def down
		remove_column :partners, :inbox_id, :integer
  end
end
