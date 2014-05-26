class ListsController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@lists = List.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		@list_tab = 'list'
	end
	
	def show
		@list = List.find(params[:id])
		@list_tab = 'list'
	end
	
	def new
		@list = List.new
		@list_tab = 'add'
	end
	
	def create
		@list = List.create(list_params)
    	if @list.save
    		flash[:success] = "List created"
      		redirect_to list_path(@list)
    	else
    		flash[:danger] = "List could not be created"
      		render 'new'
    	end
	end
	
	def edit
		@list = List.find(params[:id])
		@list_tab = 'list'
	end
	
	def update
		@list = List.find(params[:id])
		if @list.update_attributes(list_params)
			flash[:success] = "List updated"
			@list.list_id = @list.id
			redirect_to list_path(@list)
		else
			flash[:danger] = "List could not be updated"
			render 'edit'
		end
	end
	
	def destroy
		List.find(params[:id]).destroy
		flash[:success] = "List Deleted"
		redirect_to lists_path
	end
private
	
	def list_params
		params.require(:list).permit(:list_id,:list_name,:active,:list_description,:campaign_id,:reset_time)
	end
	
	def sort_column
		List.column_names.include?(params[:sort]) ? params[:sort] : "list_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
