class User < ActiveRecord::Base
	USER_LEVELS = ["1","2","3","4","5","6","7","8","9"]
	validates :user, length: { in: 2..20 }, numericality: { only_integer: true }
	validates :pass, presence: true, length: { minimum: 8 }
	validates :full_name, presence: true
	validates :user_level, presence: true
	validates :user_group, presence: true
end
