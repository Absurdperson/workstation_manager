class AddColumnPartnerName < ActiveRecord::Migration
  def up
  		add_column :inboxes, :partner_name, :string
  end

  def down
		remove_column :inboxes, :partner_name, :string
  end
end
