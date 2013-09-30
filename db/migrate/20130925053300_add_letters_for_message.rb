class AddLettersForMessage < ActiveRecord::Migration
  def up
  	add_attachment :messages, :letters
  end

  def down
  	remove_attachment :messages, :letters
  end
end
