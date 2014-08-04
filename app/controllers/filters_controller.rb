class FiltersController < ApplicationController
	helper_method :sort_column, :sort_direction, :back_action

	before_filter :authorise
	
	def index
		@filter_tab = 'filter'
		@filters = Filter.order(sort_column + " " + sort_direction)
	end
	
	def show
		@filter_tab = 'filter'
		@filter	= Filter.find(params[:id])
	end

	def new
		@filter_tab = 'add_filter'
		@filter = Filter.new
	end
	
	def create
		@filter = Filter.create(filter_params.merge(:user_group => UserGroup.find(filter_params[:user_group_id]).user_group))
			if @filter.save
				flash[:success] = "Filter created"
				redirect_to filter_path(@filter)
			else
				flash[:danger] = "Filter could not be created"
				render 'new'
			end
	end
	
	def edit
		@filter_tab = 'filter'
		@filter = Filter.find(params[:id])
	end
	
	def update
		@filter = Filter.find(params[:id])
		if @filter.update_attributes(filter_params.merge(:user_group => UserGroup.find(filter_params[:user_group_id]).user_group))
			flash[:success] = "Filter Updated"
			redirect_to filter_path(@filter)
		else
			flash[:danger] = "Filter could not be updated"
			render 'edit'
		end
	end
	
	def destroy
		@filter = Filter.find(params[:id])
		@filter.destroy
		
		respond_to do |format|
			format.js
			format.html do
				flash[:success] = "Filter Deleted"
				redirect_to filters_path
			end
			format.json { head :no_content }
		end
	end
	
	private
	
	def filter_params
		params.require(:filter).permit(:lead_filter_id,:lead_filter_name,:lead_filter_comments,:lead_filter_sql,:user_group_id)
	end
	
	def sort_column
		Filter.column_names.include?(params[:sort]) ? params[:sort] : "lead_filter_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
	def back_action
		if self.action_name == 'new'
			snippet = filters_path
			snippet
		elsif self.action_name == 'edit'
			snippet = filter_path(@filter)
			snippet
		end
	end
end
