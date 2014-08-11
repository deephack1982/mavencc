class List < ActiveRecord::Base
  ACTIVE = ['Y','N']
  RESETS = ["0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000"]
  validates :list_id, presence: true, length: { in: 3..8 }, numericality: { only_integer: true }
  validates :list_name, presence: true, length: { in: 2..20 }
  validates :active, presence: true
  validates :campaign_id, presence: true
  validates :reset_time, format: { with: /([0-9]{4})?(-[0-9]{4})*/, message: "24hr clock times seperated by - only" }
  belongs_to :campaign
  has_many :leads
  
  def campaign_name
  	self.campaign.campaign_name if self.campaign
  end
  
  def dialable
  	@list_statuses = self.campaign.dial_statuses.split(" ")
  	Lead.where(list_id: self.id).where(status: @list_statuses).where("called_since_last_reset = 'N'").count
  end
end
