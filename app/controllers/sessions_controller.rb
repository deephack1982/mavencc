class SessionsController < ApplicationController
	def new
	end

  def create
		user = User.find_by_user(params[:user])
		if user && user.authenticate(params[:password]) && user.active == 'Y' && user.user_level == 9
			session[:user_id] = user.id
			redirect_to root_url flash[:success] = "Logged In"
		elsif user && user.active == 'N'
			redirect_to login_path flash[:danger] = "User not active"
		elsif user && user.user_level < 9
			redirect_to login_path flash[:danger] = "User not admin"
		else
			redirect_to login_path flash[:danger] = "Incorrect Log In"
		end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :success => "Logged Out"
  end
end
