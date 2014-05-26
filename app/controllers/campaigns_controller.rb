class CampaignsController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@campaigns = Campaign.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		@campaign_tab = 'list'
	end
	
	def show
		@campaign = Campaign.find(params[:id])
		@campaign_tab = 'list'
	end
	
	def new
		@campaign = Campaign.new
		@campaign_tab = 'add'
	end
	
	def create
		@campaign = Campaign.create(campaign_params)
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
		Campaign.find(params[:id]).destroy
		flash[:success] = "Campaign Deleted"
		redirect_to campaigns_path
	end
	
	private
	
	def campaign_params
		params.require(:campaign).permit(:campaign_id,:campaign_name,:active,:user_group,:campaign_description)
	end
	
	def sort_column
		Campaign.column_names.include?(params[:sort]) ? params[:sort] : "campaign_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end