class StatusesController < ApplicationController

	before_filter :authorise

	def index
		@admin_tab = 'status'
		@statuses = Status.all
	end
	
	def show
		@admin_tab = 'status'
		@status = Status.find(params[:id])
	end
end
