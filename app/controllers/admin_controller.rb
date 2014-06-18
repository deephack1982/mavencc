class AdminController < ApplicationController

	def index
		@admin_tab = 'index'
	end
	
	def status
		@admin_tab = 'status'
		@statuses = Status.All
	end
end
