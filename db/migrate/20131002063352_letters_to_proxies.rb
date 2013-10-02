class LettersToProxies < ActiveRecord::Migration
  def up
  	add_attachment :proxies, :letters
  end

  def down
  end
end
