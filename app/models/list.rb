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
end
