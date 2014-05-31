class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction
	def error
	end
	def index
		if params.has_key?(:search_by_fullname)
			@users = User.search_by_fullname(params[:search_by_fullname]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		elsif params.has_key?(:search_by_userid)
			@users = User.search_by_userid(params[:search_by_userid]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		elsif params.has_key?(:search_by_group)
			@users = User.search_by_group(params[:search_by_group]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		else
			@users = User.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		end
		@user_tab = 'list'
	end
	def show
		@user = User.find(params[:id])
		@user_tab = 'list'
	end
	def new
		@user = User.new
		@user_tab = 'add'
	end
	def create
		@user = User.create(user_params)
    	if @user.save
    		flash[:success] = "User created"
      		redirect_to user_path(@user)
    	else
    		flash[:danger] = "User could not be created"
      		render 'new'
    	end
	end
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User Deleted"
		redirect_to users_path
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
      			flash[:success] = "User updated"
			redirect_to user_path(@user)
	    	else
			flash[:danger] = "User could not be updated"
	      		render 'edit'
    		end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:user,:pass,:full_name,:user_level,:user_group,:phone_login,:phone_pass)
	end
	
	def sort_column
		User.column_names.include?(params[:sort]) ? params[:sort] : "user"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
