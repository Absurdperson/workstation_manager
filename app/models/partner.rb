class Partner < ActiveRecord::Base
  attr_accessible :address, :name, :contact_name, :contact_email, :contact_phone, :inbox_id, :bin, :director

  belongs_to :user
  belongs_to :inbox
  belongs_to :outbox
  belongs_to :message

  validates :user_id, presence: true
  validates :name, presence: true

  default_scope order: 'partners.created_at DESC'
end
