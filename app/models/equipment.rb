class Equipment < ActiveRecord::Base
  attr_accessible :count, :name, :val, :inbox_id, :inbox_equipment, :user, :description, :photo
  has_attached_file :photo,:less_than => 10.kilobytes

  belongs_to :user
  has_many :inbox_equipments
  has_many :outbox_equipments
  has_many :inbox, :through => :inbox_equipments
  has_many :outbox, :through => :outbox_equipments

  validates :user_id, presence: true
  validates :name, presence: true
  validates :val, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :count, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  default_scope order: 'equipment.created_at DESC'
end
