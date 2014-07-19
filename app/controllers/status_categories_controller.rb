class StatusCategoriesController < ApplicationController

	helper_method :sort_column, :sort_direction
	before_filter :authorise
	
	def index
		@admin_tab = 'status_category'
		@status_categories = StatusCategory.all
	end
	
	def show
		@admin_tab = 'status_category'
		@status_category = StatusCategory.find(params[:id])
	end
	
	private
	
	def sort_column
			Status.column_names.include?(params[:sort]) ? params[:sort] : "id"
		end
	
		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
end
