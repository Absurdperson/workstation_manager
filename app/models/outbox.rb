class Outbox < ActiveRecord::Base
  attr_accessible  :theme,  :letters, :outbox_equipments, :partners, :equipments, :inboxes, :inbox_id,  :partner_id, :equipment_id, :equipment_ids, :applicaton_type
  serialize :equipments, Array
  has_attached_file :letters
  
  belongs_to :user
  has_many :outbox_equipments
  has_many :inboxes, :foreign_key => "id", :primary_key => "inbox_id"
  has_many :partners, :foreign_key => "id", :primary_key => "partner_id"
  has_many :equipments, :through => :outbox_equipments
  
  validates :user_id, presence: true
  validates :theme, presence: true
  validates :partner_id, presence: true
  #validates :equipment_id, presence: true
  
  default_scope order: 'outboxes.created_at DESC'
end
