class Message < ActiveRecord::Base
  attr_accessible :description, :partner_id, :letter_type, :user_id, :letters
  has_attached_file :letters

  
  belongs_to :user
  belongs_to :partner
  
  validates :user_id, presence: true
  validates :description, presence: true
  validates :partner_id, presence: true
  validates :letters, presence: true
  validates :letter_type, presence: true
  
  default_scope order: 'messages.created_at DESC'
end
