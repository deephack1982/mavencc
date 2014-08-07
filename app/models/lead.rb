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
  
  def self.import(file,list,duplicatecheck,numbervalidation)
	def createlead
		@currentlead = Lead.create! @currentlead
		@currentlead[:lead_id] = @currentlead[:id]
		@currentlead.save
		@receipt["loaded"] = @receipt["loaded"] + 1
	end
	@receipt = { "loaded" => 0, "duplicates" => 0 , "invalid" => 0 }
  	CSV.foreach(file.path,headers: true) do |row|
  		row["list_id"] = list
  		row["status"] = 'NEW'
		@currentlead = row.to_hash
		if numbervalidation == "Y"
			if ( @currentlead["phone_number"].length > 11 || @currentlead["phone_number"].length < 9 || @currentlead["phone_number"].first != "0" )
				@receipt["invalid"] = @receipt["invalid"] + 1
				next
			end
		end
		if duplicatecheck == "Y"
			if Lead.find_by_phone_number(@currentlead["phone_number"])
				@receipt["duplicates"] = @receipt["duplicates"] + 1
				next
			end
		end
		createlead
  	end
	@receipt
  end
end
