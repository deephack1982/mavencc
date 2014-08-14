class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction, :inactive_users, :convert_permission
	
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
		@io_attributes = [ "delete_users","delete_user_groups","alert_enabled","download_lists","manager_shift_enforcement_override","shift_override_flag","export_reports","delete_from_dnc","allow_alerts","agent_choose_territories","callcard_admin","agent_choose_blended","realtime_block_user_info","custom_fields_modify","modify_shifts","modify_phones","modify_carriers","modify_labels","modify_statuses","modify_voicemail","modify_audiostore","modify_moh","modify_tts","modify_contacts","modify_same_user_level","admin_hide_lead_data","agentcall_email","modify_email_accounts","alter_admin_interface_options","modify_custom_dialplans" ]
		@yn_attributes = [ "active","force_change_password" ]

		@yn_attributes.each do |attribute|
		flip_attribute_yn("#{attribute}")
		end
		@io_attributes.each do |attribute|
			flip_attribute_io("#{attribute}")
		end
		def eval(attribute)
			puts attribute
		end

	end
	def new
		@user = User.new
		@user_tab = 'add'
	end
	def create
		@user = User.create(user_params.merge(:user_group => UserGroup.find(user_params[:user_group_id]).user_group))
    	if @user.save
      		redirect_to user_path(@user), :success => "User created"
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
				redirect_to users_path, :success => "User deleted"
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
			redirect_to user_path(@user), :success => "User updated"
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

	def convert_permission(permission)
		if permission == '1'
			'Y'
		elsif permission == '0'
			'N'
		end
	end

	def flip_attribute_io(attribute)
                if params[:"#{attribute}"] == '1'
                        @user.update_attribute(:"#{attribute}", "0")
                        redirect_to user_path(@user)
                elsif params[:"#{attribute}"] == '0'
                        @user.update_attribute(:"#{attribute}", "1")
                        redirect_to user_path(@user)
                end
	end

	def flip_attribute_yn(attribute)
                if params[:"#{attribute}"] == 'Y'
                        @user.update_attribute(:"#{attribute}", "N")
                        redirect_to user_path(@user)
                elsif params[:"#{attribute}"] == 'N'
                        @user.update_attribute(:"#{attribute}", "Y")
                        redirect_to user_path(@user)
                end
	end
end
