class Lead < ActiveRecord::Base
  self.table_name = "list"
  belongs_to :list
  
  def self.search(search)
  	if search
  		find(:all, :conditions => ['phone_number LIKE ?', "%#{search}%"])
  	else
  		find(:all)
  	end
  end
  
  def list_id
  	self.list.list_id if self.list
  end
end
