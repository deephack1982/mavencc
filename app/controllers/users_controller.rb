class UsersController < ApplicationController
	def error
	end
	def index
		@user_tab = 'list'
	end
	def show
		@user = User.find(params[:id])
		@user_tab = 'list'
	end
	def list
		@user_tab = 'list'
	end
	def new
		@user = User.new
		@user_tab = 'add'
	end
	def create
		@user = User.create(user_params)
    	if @user.save
      		redirect_to users_path
    	else
      		render 'error'
    	end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:phone_login, :phone_pass)
	end
end
