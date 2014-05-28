class Lead < ActiveRecord::Base
  self.table_name = "list"
  belongs_to :list
  
  def self.search_by_phone(search)
  	find(:all, :conditions => ['phone_number LIKE ?', "#{search}%"])
  end
  
  def self.search_by_postcode(search)
  	find(:all, :conditions => ['postal_code LIKE ?', "#{search}%"])
  end
  
  def list_id
  	self.list.list_id if self.list
  end
end
