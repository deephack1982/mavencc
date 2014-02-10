class UsersController < ApplicationController
	def error
	end
	def index
	end
	def show
		@user = User.find(params[:id])
	end
	def list
	end
	def new
		@user = User.new
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
