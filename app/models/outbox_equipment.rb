class OutboxEquipment < ActiveRecord::Base
  attr_accessible :equipment_id, :inbox_id
  
	belongs_to :equipment
	belongs_to :outbox
end
