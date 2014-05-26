class Campaign < ActiveRecord::Base
	ACTIVE = ["Y","N"]
	validates :campaign_id, uniqueness: true, presence: true, length: { in: 2..8 }
	validates :campaign_name, uniqueness: true, presence: true, length: { in: 6..40 }
	has_many :lists
end
