class SessionsController < ApplicationController
	def new
	end

  def create
		user = User.find_by_user(params[:user])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url flash[:success] = "Logged In"
		else
			flash[:danger] = "Incorrect Log In"
		end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url flash[:success] = "Logged Out"
  end
end
