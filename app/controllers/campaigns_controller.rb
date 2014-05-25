class CampaignsController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@campaign_tab = 'list'
		@campaigns = Campaign.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
	end
	
	private
	
	def sort_column
		Campaign.column_names.include?(params[:sort]) ? params[:sort] : "campaign_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
