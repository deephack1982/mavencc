class UsersController < ApplicationController
	def error
	end
	def index
		@user_tab = 'list'
		@users = User.paginate(page: params[:page], :per_page => 10)
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
    		flash[:danger] = "User could not created"
      		render 'new'
    	end
	end
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User Deleted"
		redirect_to users_path
	end
	
	private
	
	def user_params
		params.require(:user).permit(:user,:pass,:full_name,:user_level,:user_group,:phone_login,:phone_pass)
	end
end
