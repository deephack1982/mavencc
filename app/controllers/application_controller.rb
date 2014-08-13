class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
	private
		def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
  
	def authorise
		redirect_to login_url if current_user.nil?
		if current_user.delete_users == '0' && params[:controller] == 'users' && params[:action] == 'destroy'
			flash[:danger] = 'Insufficient Permissions'
			redirect_to campaigns_path
		end
		if current_user.delete_user_groups == '0' && params[:controller] == 'user_groups' && params[:action] == 'destroy'
			flash[:danger] = 'Insufficient Permissions'
			redirect_to campaigns_path
		end
		if current_user.download_lists == '0' && params[:controller] == 'lists' && params[:action] == 'show.csv'
			flash[:danger] = 'Insufficient Permissions'
			redirect_to show_lists_path
		end
	end
  
  helper_method :current_user
end
