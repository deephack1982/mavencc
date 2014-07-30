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
		if params[:active] == 'Y'
			@user.update_attribute(:active, "N")
			redirect_to user_path(@user)
		elsif params[:active] == 'N'
			@user.update_attribute(:active, "Y")
			redirect_to user_path(@user)
		end
		if params[:force_change_password] == 'Y'
                        @user.update_attribute(:force_change_password, "N")
                        redirect_to user_path(@user)
                elsif params[:force_change_password] == 'N'
                        @user.update_attribute(:force_change_password, "Y")
                        redirect_to user_path(@user)
                end
                if params[:delete_users] == '1'
                        @user.update_attribute(:delete_users, "0")
                        redirect_to user_path(@user)
                elsif params[:delete_users] == '0'
                        @user.update_attribute(:delete_users, "1")
                        redirect_to user_path(@user)
                end
                if params[:delete_user_groups] == '1'
                        @user.update_attribute(:delete_user_groups, "0")
                        redirect_to user_path(@user)
                elsif params[:delete_user_groups] == '0'
                        @user.update_attribute(:delete_user_groups, "1")
                        redirect_to user_path(@user)
                end
		if params[:alert_enabled] == '1'
			@user.update_attribute(:alert_enabled, "0")
			redirect_to user_path(@user)
		elsif params[:alert_enabled] == '0'
			@user.update_attribute(:alert_enabled, "1")
			redirect_to user_path(@user)
		end
                if params[:download_lists] == '1'
                        @user.update_attribute(:download_lists, "0")
                        redirect_to user_path(@user)
                elsif params[:download_lists] == '0'
                        @user.update_attribute(:download_lists, "1")
                        redirect_to user_path(@user)
                end
                if params[:manager_shift_enforcement_override] == '1'
                        @user.update_attribute(:manager_shift_enforcement_override, "0")
                        redirect_to user_path(@user)
                elsif params[:manager_shift_enforcement_override] == '0'
                        @user.update_attribute(:manager_shift_enforcement_override, "1")
                        redirect_to user_path(@user)
                end
                if params[:shift_override_flag] == '1'
                        @user.update_attribute(:shift_override_flag, "0")
                        redirect_to user_path(@user)
                elsif params[:shift_override_flag] == '0'
                        @user.update_attribute(:shift_override_flag, "1")
                        redirect_to user_path(@user)
                end
                if params[:export_reports] == '1'
                        @user.update_attribute(:export_reports, "0")
                        redirect_to user_path(@user)
                elsif params[:export_reports] == '0'
                        @user.update_attribute(:export_reports, "1")
                        redirect_to user_path(@user)
                end
		if params[:delete_from_dnc] == '1'
                        @user.update_attribute(:delete_from_dnc, "0")
                        redirect_to user_path(@user)
                elsif params[:delete_from_dnc] == '0'
                        @user.update_attribute(:delete_from_dnc, "1")
                        redirect_to user_path(@user)
                end
		if params[:allow_alerts] == '1'
                        @user.update_attribute(:allow_alerts, "0")
                        redirect_to user_path(@user)
                elsif params[:allow_alerts] == '0'
                        @user.update_attribute(:allow_alerts, "1")
                        redirect_to user_path(@user)
                end
		if params[:agent_choose_territories] == '1'
                        @user.update_attribute(:agent_choose_territories, "0")
                        redirect_to user_path(@user)
                elsif params[:agent_choose_territories] == '0'
                        @user.update_attribute(:agent_choose_territories, "1")
                        redirect_to user_path(@user)
                end
		if params[:callcard_admin] == '1'
                        @user.update_attribute(:callcard_admin, "0")
                        redirect_to user_path(@user)
                elsif params[:callcard_admin] == '0'
                        @user.update_attribute(:callcard_admin, "1")
                        redirect_to user_path(@user)
                end
		if params[:agent_choose_blended] == '1'
                        @user.update_attribute(:agent_choose_blended, "0")
                        redirect_to user_path(@user)
                elsif params[:agent_choose_blended] == '0'
                        @user.update_attribute(:agent_choose_blended, "1")
                        redirect_to user_path(@user)
                end
		if params[:realtime_block_user_info] == '1'
                        @user.update_attribute(:realtime_block_user_info, "0")
                        redirect_to user_path(@user)
                elsif params[:realtime_block_user_info] == '0'
                        @user.update_attribute(:realtime_block_user_info, "1")
                        redirect_to user_path(@user)
                end
		if params[:custom_fields_modify] == '1'
                        @user.update_attribute(:custom_fields_modify, "0")
                        redirect_to user_path(@user)
                elsif params[:custom_fields_modify] == '0'
                        @user.update_attribute(:custom_fields_modify, "1")
                        redirect_to user_path(@user)
                end
		if params[:modify_shifts] == '1'
                        @user.update_attribute(:modify_shifts, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_shifts] == '0'
                        @user.update_attribute(:modify_shifts, "1")
                        redirect_to user_path(@user)
                end
		if params[:modify_phones] == '1'
                        @user.update_attribute(:modify_phones, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_phones] == '0'
                        @user.update_attribute(:modify_phones, "1")
                        redirect_to user_path(@user)
                end
		if params[:modify_carriers] == '1'
                        @user.update_attribute(:modify_carriers, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_carriers] == '0'
                        @user.update_attribute(:modify_carriers, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_labels] == '1'
                        @user.update_attribute(:modify_labels, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_labels] == '0'
                        @user.update_attribute(:modify_labels, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_statuses] == '1'
                        @user.update_attribute(:modify_statuses, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_statuses] == '0'
                        @user.update_attribute(:modify_statuses, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_voicemail] == '1'
                        @user.update_attribute(:modify_voicemail, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_voicemail] == '0'
                        @user.update_attribute(:modify_voicemail, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_audiostore] == '1'
                        @user.update_attribute(:modify_audiostore, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_audiostore] == '0'
                        @user.update_attribute(:modify_audiostore, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_moh] == '1'
                        @user.update_attribute(:modify_moh, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_moh] == '0'
                        @user.update_attribute(:modify_moh, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_tts] == '1'
                        @user.update_attribute(:modify_tts, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_tts] == '0'
                        @user.update_attribute(:modify_tts, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_contacts] == '1'
                        @user.update_attribute(:modify_contacts, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_contacts] == '0'
                        @user.update_attribute(:modify_contacts, "1")
                        redirect_to user_path(@user)
                end
                if params[:modify_same_user_level] == '1'
                        @user.update_attribute(:modify_same_user_level, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_same_user_level] == '0'
                        @user.update_attribute(:modify_same_user_level, "1")
                        redirect_to user_path(@user)
                end
                if params[:admin_hide_lead_data] == '1'
                        @user.update_attribute(:admin_hide_lead_data, "0")
                        redirect_to user_path(@user)
                elsif params[:admin_hide_lead_data] == '0'
                        @user.update_attribute(:admin_hide_lead_data, "1")
                        redirect_to user_path(@user)
                end
                if params[:agentcall_email] == '1'
                        @user.update_attribute(:agentcall_email, "0")
                        redirect_to user_path(@user)
                elsif params[:agentcall_email] == '0'
                        @user.update_attribute(:agentcall_email, "1")
                        redirect_to user_path(@user)
                end
		if params[:modify_email_accounts] == '1'
                        @user.update_attribute(:modify_email_accounts, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_email_accounts] == '0'
                        @user.update_attribute(:modify_email_accounts, "1")
                        redirect_to user_path(@user)
                end
		if params[:alter_admin_interface_options] == '1'
                        @user.update_attribute(:alter_admin_interface_options, "0")
                        redirect_to user_path(@user)
                elsif params[:alter_admin_interface_options] == '0'
                        @user.update_attribute(:alter_admin_interface_options, "1")
                        redirect_to user_path(@user)
                end
		if params[:modify_custom_dialplans] == '1'
                        @user.update_attribute(:modify_custom_dialplans, "0")
                        redirect_to user_path(@user)
                elsif params[:modify_custom_dialplans] == '0'
                        @user.update_attribute(:modify_custom_dialplans, "1")
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

	def convert_permission(permission)
		if permission == '1'
			'Y'
		elsif permission == '0'
			'N'
		end
	end
end
