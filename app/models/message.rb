class Message < ActiveRecord::Base
  attr_accessible :description, :partner_id, :user_id, :letters, :partners
  has_attached_file :letters, :default_url => "system/letters/letter.doc"

  belongs_to :user
  has_many :partners, :foreign_key => "id", :primary_key => "partner_id"
  
  validates :user_id, presence: true
  validates :description, presence: true
  validates :partner_id, presence: true
  
  default_scope order: 'messages.created_at DESC'
end
