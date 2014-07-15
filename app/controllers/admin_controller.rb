class AdminController < ApplicationController

	before_filter :authorise

	def index
		@admin_tab = 'index'
	end
	
end
