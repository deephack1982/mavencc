class Campaign < ActiveRecord::Base
	ACTIVE = ["Y","N"]
	LEAD_ORDER = ["DOWN","UP","RANDOM","DOWN COUNT","UP COUNT"]
	HOPPER_LEVEL = [1,5,10,20,50,100,200,500,700,1000,2000]
	DIAL_METHOD = ["MANUAL","RATIO","ADAPT_HARD_LIMIT","ADAPT_TAPERED","ADAPT_AVERAGE","INBOUND_MAN"]
	AUTO_DIAL_LEVEL = [1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4]
	ADAPTIVE_INTENSITY = Array (-40..40)
	validates :campaign_id, uniqueness: true, presence: true, length: { in: 2..8 }
	validates :campaign_name, uniqueness: true, presence: true, length: { in: 6..40 }
	validates :lead_order, presence: true
	validates :hopper_level, presence: true
	has_many :lists
	accepts_nested_attributes_for :lists
end
