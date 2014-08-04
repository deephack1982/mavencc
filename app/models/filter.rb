class Filter < ActiveRecord::Base
	self.table_name = "lead_filters"
	
	validates :lead_filter_id, uniqueness: true, presence: true, length: { in: 2..10 }
	validates :lead_filter_name, presence: true, length: { in: 2..50 }

  belongs_to :user_user_group, :class_name => "UserGroup", :foreign_key => "user_group_id"
end
