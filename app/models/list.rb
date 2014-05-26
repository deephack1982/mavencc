class List < ActiveRecord::Base
	ACTIVE = ["Y","N"]
	validates :list_id, uniqueness: true, presence: true, length: { in: 3..8 }, numericality: { only_integer: true }
	validates :list_name, presence: true, length: { in: 2..20 }
end
