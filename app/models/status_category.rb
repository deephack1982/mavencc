class StatusCategory < ActiveRecord::Base
	validates_inclusion_of :tovdad_display, :in => [:Y, :N]
	validates_inclusion_of :sale_category, :in => [:Y, :N]
	validates_inclusion_of :dead_lead_category, :in => [:Y, :N]
	
	has_many :status
end
