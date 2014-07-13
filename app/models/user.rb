class User < ActiveRecord::Base
	USER_LEVELS = ["1","2","3","4","5","6","7","8","9"]
	ACTIVE = ["Y","N"]
	validates :user, uniqueness: true, presence: true, length: { in: 2..20 }, numericality: { only_integer: true }
	validates :pass, presence: true, length: { minimum: 8 }
	validates :full_name, presence: true
	validates :user_level, presence: true
	validates :user_group, presence: true
	validates :active, presence: true
	
	belongs_to :user_user_group, :class_name => "UserGroup", :foreign_key => "user_group_id"
	
	def group_name
		self.user_group.group_name if self.user_group
	end
	
	def self.search_by_fullname(search)
		where("full_name LIKE ?", "%#{search}%")
	end
	
	def self.search_by_userid(search)
		where("user = ?", "#{search}")
	end
	
	def self.search_by_group(search)
		where("user_group = ?", "#{search}")
	end
end
