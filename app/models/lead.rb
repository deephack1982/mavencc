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
  
  def self.import(file,list,duplicatecheck)
  	CSV.foreach(file.path,headers: true) do |row|
  		row["list_id"] = list
  		row["status"] = 'NEW'
		@currentlead = row.to_hash
		if duplicatecheck = "Y"
			if Lead.find_by_phone_number(@currentlead["phone_number"])
			else
  				@currentlead = Lead.create! @currentlead
				@currentlead[:lead_id] = @currentlead[:id]
				@currentlead.save
			end
		else
			Lead.create! @currentlead
			@currentlead[:lead_id] = @currentlead[:id]
			@currentlead.save
		end
  	end
  end
end
