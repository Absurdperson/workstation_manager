class LettersToPretension < ActiveRecord::Migration
  def up
  	add_attachment :pretensions, :letters
  end

  def down
  end
end
