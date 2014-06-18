class AdminController < ApplicationController

	def index
		@admin_tab = 'index'
	end
	
	def statuses_index
		@admin_tab = 'status'
		@statuses = Status.all
	end
	
	def status
		@status = Status.find(params[:id])
	end
end
