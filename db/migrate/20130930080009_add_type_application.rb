class AddTypeApplication < ActiveRecord::Migration
  def up
  	add_column :inboxes, :application_type, :string
  	add_column :outboxes, :application_type, :string
  end

  def down
  end
end
