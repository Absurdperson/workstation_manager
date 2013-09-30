class RemoveIndexesInThePartners < ActiveRecord::Migration
  def up
  	remove_index :partners, :name => :index_partners_on_user_id_and_created_at_and_name_and_address
  end

  def down
  end
end
