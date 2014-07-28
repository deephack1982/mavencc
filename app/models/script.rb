class Script < ActiveRecord::Base

	ACTIVE = ["Y","N"]
	validates :script_id, uniqueness: true, presence: true, length: { in: 2..10 }
	validates :script_name, presence: true, length: { in: 2..50 }
	
	
	belongs_to :user_group
end
