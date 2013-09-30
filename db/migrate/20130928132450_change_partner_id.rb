class ChangePartnerId < ActiveRecord::Migration
  def up
  	change_column :inboxes, :partner_id, :integer
  end

  def down
   	change_column :inboxes, :partner_id, :string
  end
end
