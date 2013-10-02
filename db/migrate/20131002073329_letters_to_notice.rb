class LettersToNotice < ActiveRecord::Migration
  def up
  	add_attachment :trusts, :letters
  	add_attachment :notices, :letters
  end

  def down
  end
end
