class Script < ActiveRecord::Base

	ACTIVE = ["Y","N"]
	validates :script_id, uniqueness: true, presence: true, length: { in: 2..10 }
	validates :script_name, presence: true, length: { in: 2..50 }
	
	belongs_to :user_user_group, :class_name => "UserGroup", :foreign_key => "user_group_id"
	has_many :campaigns
	
	def group_name
		self.user_group.group_name if self.user_group
	end
end
