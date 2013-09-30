class AddLetters < ActiveRecord::Migration
  def up
	add_attachment :inboxes, :letters
  end

  def down
	remove_attachment :inboxes, :letters
  end
end
