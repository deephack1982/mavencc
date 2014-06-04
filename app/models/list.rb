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
  
  def to_csv
  	csv_file = ''
  	@leads = Lead.where("list_id = ?", "#{self.id}")
  	headings = ['lead_id','status','phone_number','title','first_name','last_name','address1','address2','address3','city','province','postal_code']
  	headings.each do |c|
  		csv_file << c << ','
  	end
  	csv_file.chomp(',')
  	csv_file << "\n"
	@leads.each do |v|
		csv_file << v.lead_id.to_s << ','
		csv_file << v.status << ','
		csv_file << v.phone_number << ','
		csv_file << v.title << ','
		csv_file << v.first_name << ','
		csv_file << v.last_name << ','
		csv_file << v.address1 << ','
		csv_file << v.address2 << ','
		csv_file << v.address3 << ','
		csv_file << v.city << ','
		csv_file << v.province << ','
		csv_file << v.postal_code << ','
		csv_file.chomp(',')
		csv_file << "\n"
	end
	send_data csv_file
  end
end
