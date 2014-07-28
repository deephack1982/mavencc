class Lead < ActiveRecord::Base
  self.table_name = "list"
  belongs_to :list
  
  def self.search_by_phone(search)
  	where("phone_number LIKE ?", "#{search}%")
  end
  
  def self.search_by_postcode(search)
  	where("postal_code LIKE ?", "#{search}%")
  end
  
  def list_id
  	self.list.list_id if self.list
  end
  
  def self.import(file,list)
  	CSV.foreach(file.path,headers: true) do |row|
  		row["list_id"] = list
  		row["status"] = 'NEW'
  		@currentlead = Lead.create! row.to_hash
  		@currentlead.lead_id = @currentlead.id
  		@currentlead.save
  	end
  end
end
