class LettersToInformation < ActiveRecord::Migration
  def up
  	add_attachment :information, :letters
  end

  def down
  end
end
