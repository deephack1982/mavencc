class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction, :inactive_users
	
	before_filter :authorise
	
	def error
	end
	def index
		if params[:search_type] == "Name"
			@users = User.active_users.search_by_fullname(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		elsif params[:search_type] == "UserID"
			@users = User.active_users.search_by_userid(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		elsif params[:search]
			@users = User.active_users.search_by_group(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		else
			@users = User.active_users.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		end
		
		if params[:inactive] == 'Y'
			@inactive = "glyphicon-ok"
			@users = User.inactive.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		elsif params[:inactive] == 'N'
			@inactive = ""
		end
		
		@user_tab = 'list'
	end
	def show
		@user = User.find(params[:id])
		@user_tab = 'list'
		if params[:active] == 'Y'
			@user.update_attribute(:active, "N")
			redirect_to user_path(@user)
		elsif params[:active] == 'N'
			@user.update_attribute(:active, "Y")
			redirect_to user_path(@user)
		end
	end
	def new
		@user = User.new
		@user_tab = 'add'
	end
	def create
		@user = User.create(user_params.merge(:user_group => UserGroup.find(user_params[:user_group_id]).user_group))
    	if @user.save
    		flash[:success] = "User created"
      		redirect_to user_path(@user)
    	else
    		flash[:danger] = "User could not be created"
      		render 'new'
    	end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		
		respond_to do |format|
			format.js
			format.html do
				flash[:success] = "User Deleted"
				redirect_to users_path
			end
			format.json { head :no_content }
		end
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params.merge(:user_group => UserGroup.find(user_params[:user_group_id]).user_group))
      			flash[:success] = "User updated"
			redirect_to user_path(@user)
	    	else
			flash[:danger] = "User could not be updated"
	      		render 'edit'
    		end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:user,:password,:password_confirmation,:full_name,:user_level,:user_group,:phone_login,:phone_pass,:active,:user_group_id)
	end
	
	def sort_column
		User.column_names.include?(params[:sort]) ? params[:sort] : "user"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
	def inactive_users
		if params[:inactive] == 'Y'
			snippet = "N"
			snippet.to_s
		elsif params[:inactive] == 'N'
			snippet = "Y"
			snippet.to_s
		else
			snippet = "Y"
			snippet.to_s
		end
	end
end
