class ChangeInboxIdTypeToOutboxes < ActiveRecord::Migration
  def up
  	change_column :outboxes, :inbox_id, :integer
  end

  def down
  	change_column :outboxes, :inbox_id, :integer
  end
end
