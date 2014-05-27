class LeadsController < ApplicationController
	helper_method :sort_column, :sort_direction
	def show
		@lead = Lead.find(params[:id])
	end
	
	def new
		@lead = Lead.new
		@list_tab = 'newlead'
	end
	
	def create
		@lead = Lead.create(lead_params)
		@lead.lead_id = @lead.id
	if @lead.save
		flash[:success] = "Lead created"
		redirect_to lead_path(@lead)
	else
		flash[:danger] = "Lead could not be created"
		render 'new'
	end
	end
	
	def search
		@leads = Lead.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		@leads = @leads.search(params[:search])
	end
	
	private
	
	def lead_params
		params.require(:lead).permit(:lead_id,:status,:vendor_lead_code,:source_id,:list_id,:phone_code,:phone_number,:title,:first_name,:middle_initial,:last_name,:address1,:address2,:address3,:city,:state,:province,:postal_code,:country_code,:gender,:date_of_birth,:alt_phone,:email,:security_phrase,:comments)
	end
	
	def sort_column
		Lead.column_names.include?(params[:sort]) ? params[:sort] : "lead_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
