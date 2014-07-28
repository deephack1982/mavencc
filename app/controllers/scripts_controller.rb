class ScriptsController < ApplicationController
	helper_method :sort_column, :sort_direction

	before_filter :authorise
		
	def index
		@scripts = Script.order(sort_column + " " + sort_direction)
		@script_tab = 'list'
	end
	
	private
	
	def script_params
		params.require(:script).permit(:script_id,:script_name,:script_comments,:script_text,:active,:user_group)
	end
	
	def sort_column
		List.column_names.include?(params[:sort]) ? params[:sort] : "script_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
