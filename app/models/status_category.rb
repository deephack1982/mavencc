class StatusCategory < ActiveRecord::Base
	validates_inclusion_of :tovdad_display, :in => [:Y, :N]
	validates_inclusion_of :sale_category, :in => [:Y, :N]
	validates_inclusion_of :dead_lead_category, :in => [:Y, :N]
	
	def tovdad_display
		read_attribute(:tovdad_display).to_sym
	end
	
	def tovdad_display= (value)
		write_attribute(:tovdad_display, value.to_s)
	end
end
