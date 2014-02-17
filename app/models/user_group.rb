class UserGroup < ActiveRecord::Base
	validates :user_group, uniqueness: true, presence: true, length: { in: 2..20 }
	validates :group_name, presence: true, length: { maximum: 40 }
end