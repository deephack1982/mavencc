class ScriptsController < ApplicationController
	helper_method :sort_column, :sort_direction

	before_filter :authorise
		
	def index
		@script_tab = 'list'
		@scripts = Script.order(sort_column + " " + sort_direction)
	end
	
	def new
		@script_tab = 'add_script'
		@script = Script.new
	end
	
	def create
		@script = Script.create(script_params)
			if @script.save
				flash[:success] = "Script created"
				redirect_to script_path(@script)
			else
				flash[:danger] = "Script could not be created"
				render 'new'
			end
	end
		
	def show
		@script_tab = 'show_script'
		@script	= Script.find(params[:id])
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
