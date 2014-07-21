class StatusCategory < ActiveRecord::Base

	has_many :status
	
	validates :vsc_id, uniqueness: true, presence: true, length: { in: 2..20 }
	validates :vsc_name, uniqueness: true, presence: true, length: { in: 2..50 }
	
end
