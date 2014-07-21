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
	
	def new
		@admin_tab = 'add_status_category'
		@status_category = StatusCategory.new
	end
	
	def create
		@status_category = StatusCategory.create(status_category_params)
			if @status_category.save
				flash[:success] = "Status category created"
				redirect_to status_category_path(@status_category)
			else
				flash[:danger] = "Status category could not be created"
				render 'new'
			end
		end
	
	private
	
	def status_category_params
		params.require(:status_category).permit(:vsc_id,:vsc_name,:vsc_decsription)
	end
	
	def sort_column
		Status.column_names.include?(params[:sort]) ? params[:sort] : "id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
