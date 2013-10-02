class Partner < ActiveRecord::Base
  attr_accessible :address, :name, :contact_name, :contact_email, :contact_phone, :inbox_id, :bin, :director, :contact_date, :type_of_activity
  
  belongs_to :user
  belongs_to :inbox
  belongs_to :outbox
  belongs_to :message
  belongs_to :pretension
  belongs_to :information
  belongs_to :trust
  belongs_to :notice

  validates :user_id, presence: true
  validates :name, presence: true
  validates_uniqueness_of :type_of_activity, :case_sensitive => false
  #default_scope order('name ASC')
  
def self.search(search)
  if search
	find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end  
end
  
end
