class CampaignsController < ApplicationController
	helper_method :sort_column, :sort_direction
	
	before_filter :authorise
	
	def index
		@campaigns = Campaign.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		@campaign_tab = 'list'
	end
	
	def show
		@campaign = Campaign.find(params[:id])
		@statuses_in_campaign = Lead.where(list_id: @campaign.lists.pluck(:list_id)).group(:status).count
		@statuses = @campaign.dial_statuses.split(" ")
		@leads_in_campaign = Lead.where(list_id: @campaign.lists.where(active: "Y").pluck(:list_id)).where(status: @statuses).where("called_since_last_reset = 'N'").count
		@campaign_user_group = UserGroup.find(@campaign.user_group).group_name
		@campaign_tab = 'list'
		if params[:activate_list] == 'N'
			@list = List.find(params[:list])
			@list.update_attribute(:active, "Y")
			redirect_to campaign_path(@campaign)
		elsif params[:activate_list] == 'Y'
			@list = List.find(params[:list])
			@list.update_attribute(:active, "N")
			redirect_to campaign_path(@campaign)
		end
		if params[:active] == 'Y'
			@campaign.update_attribute(:active, "N")
			redirect_to campaign_path(@campaign)
		elsif params[:active] == 'N'
			@campaign.update_attribute(:active, "Y")
			redirect_to campaign_path(@campaign)
		end
		if params.has_key?(:remove_dial_status)
			@statuses.delete(params[:remove_dial_status])
			@status_to_remove = " " + @statuses.join(" ") + " "
			@campaign.update_attribute(:dial_statuses, @status_to_remove)
			flash[:success] = "Dial status #{params[:remove_dial_status]} removed"
			redirect_to campaign_path(@campaign)
		end
		
		if params.has_key?(:add_dial_status)
			@statuses << params[:add_dial_status] unless @statuses.include?(params[:add_dial_status])
			@status_to_add = " " + @statuses.join(" ") + " "
			@campaign.update_attribute(:dial_statuses, @status_to_add)
			flash[:success] = "Dial status #{params[:add_dial_status]} added"
			redirect_to campaign_path(@campaign)
		end
		
	end
	
	def new
		@campaign = Campaign.new
		@campaign_tab = 'add'
	end
	
	def create
		@campaign = Campaign.create(campaign_params.merge(:dial_statuses => ' NEW '))
    	if @campaign.save
    		flash[:success] = "Campaign created"
      		redirect_to campaign_path(@campaign)
    	else
    		flash[:danger] = "Campaign could not be created"
      		render 'new'
    	end
	end
	
	def edit
		@campaign = Campaign.find(params[:id])
		@campaign_tab = 'list'
	end
	
	def update
		@campaign = Campaign.find(params[:id])
		if @campaign.update_attributes(campaign_params)
			flash[:success] = "Campaign updated"
			@campaign.campaign_id = @campaign.id
			redirect_to campaign_path(@campaign)
		else
			flash[:danger] = "Campaign could not be updated"
			render 'edit'
		end
	end
	
	def destroy
		@campaign = Campaign.find(params[:id])
		@campaign.destroy
		
		respond_to do |format|
			format.js
			format.html do
				flash[:success] = "Campaign Deleted"
				redirect_to campaigns_path
			end
			format.json { head :no_content }
		end
	end
	
	private
	
	def campaign_params
		params.require(:campaign).permit(:campaign_id,:campaign_name,:active,:user_group,:campaign_description,:lead_order,:hopper_level,:dial_method,:auto_dial_level,:adaptive_intensity, :lists_attributes, :dial_status)
	end
	
	def sort_column
		Campaign.column_names.include?(params[:sort]) ? params[:sort] : "campaign_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
