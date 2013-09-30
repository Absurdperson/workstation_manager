class AddLettersToOutbox < ActiveRecord::Migration
  def up
	add_attachment :outboxes, :letters
  end

  def down
	remove_attachment :outboxes, :letters
  end
end
