class ScriptsController < ApplicationController
	helper_method :sort_column, :sort_direction, :back_action

	before_filter :authorise
		
	def index
		@script_tab = 'script'
		@scripts = Script.order(sort_column + " " + sort_direction)
	end
	
	def show
		@script_tab = 'script'
		@script	= Script.find(params[:id])
	end

	def new
		@script_tab = 'add_script'
		@script = Script.new
	end
	
	def create
		@script = Script.create(script_params.merge(:user_group => UserGroup.find(script_params[:user_group_id]).user_group))
			if @script.save
				flash[:success] = "Script created"
				redirect_to script_path(@script)
			else
				flash[:danger] = "Script could not be created"
				render 'new'
			end
	end
	
	def edit
		@script_tab = 'script'
		@script = Script.find(params[:id])
	end
	
	def update
		@script = Script.find(params[:id])
		if @script.update_attributes(script_params.merge(:user_group => UserGroup.find(script_params[:user_group_id]).user_group))
			flash[:success] = "Script Updated"
			redirect_to script_path(@script)
		else
			flash[:danger] = "Script could not be updated"
			render 'edit'
		end
	end
	
	def destroy
		@script = Script.find(params[:id])
		@script.destroy
		
		respond_to do |format|
			format.js
			format.html do
				flash[:success] = "Script Deleted"
				redirect_to scripts_path
			end
			format.json { head :no_content }
		end
	end
			
	private
	
	def script_params
		params.require(:script).permit(:script_id,:script_name,:script_comments,:script_text,:active,:user_group_id)
	end
	
	def sort_column
		List.column_names.include?(params[:sort]) ? params[:sort] : "script_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
	def back_action
		if self.action_name == 'new'
			snippet = scripts_path
			snippet
		elsif self.action_name == 'edit'
			snippet = script_path(@script)
			snippet
		end
	end
end
