class Outbox < ActiveRecord::Base
  attr_accessible  :theme,  :letters, :outbox_equipments, :partners, :equipments, :inboxes, :inbox_id,  :partner_id, :equipment_id, :equipment_ids, :applicaton_type
  serialize :equipments, Array
  has_attached_file :letters, :default_url => "system/outboxes/outbox.doc"
  
  belongs_to :user
  has_many :outbox_equipments
  has_many :inboxes, :foreign_key => "id", :primary_key => "inbox_id"
  has_many :partners, :foreign_key => "id", :primary_key => "partner_id"
  has_many :equipments, :through => :outbox_equipments
  

  
  default_scope order: 'outboxes.created_at DESC'
end
