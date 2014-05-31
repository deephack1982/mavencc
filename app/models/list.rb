class List < ActiveRecord::Base
  ACTIVE = ['Y','N']
  validates :list_id, presence: true, length: { in: 3..8 }, numericality: { only_integer: true }
  validates :list_name, presence: true, length: { in: 2..20 }
  validates :active, presence: true
  validates :campaign_id, presence: true
  belongs_to :campaign
  has_many :leads
  
  def campaign_name
  	self.campaign.campaign_name if self.campaign
  end
  
  def self.to_csv
  	CSV.generate do |csv|
  		csv << column_names
  		all.each do |list|
  			csv << list.attributes.values_at(*column_names)
  		end
  	end
  end
end
