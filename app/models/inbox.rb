class Inbox < ActiveRecord::Base
  attr_accessible :theme, :partners, :equipments, :partner_id, :equipment_id, :letters, :inbox_id, :inbox_equipment, :equipment_ids, :application_type
  serialize :equipments, Array
  has_attached_file :letters, :default_url => "system/inboxes/inbox.doc"
  
  belongs_to :user
  has_many :inbox_equipments
  has_many :outboxes, :foreign_key => "id", :primary_key => "outbox_id"
  has_many :partners, :foreign_key => "id", :primary_key => "partner_id"
  has_many :equipments, :through => :inbox_equipments
  
  validates :user_id, presence: true
  validates :partner_id, presence: true
  
  default_scope order: 'inboxes.created_at DESC'
end