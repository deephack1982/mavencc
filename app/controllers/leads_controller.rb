class LeadsController < ApplicationController
	helper_method :sort_column, :sort_direction
	def show
		@lead = Lead.find(params[:id])
		@list_tab = 'searchlead'
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
		if params.has_key?(:search_by_phone)
			@leads = @leads.search_by_phone(params[:search_by_phone])
		elsif params.has_key?(:search_by_postcode)
			@leads = @leads.search_by_postcode(params[:search_by_postcode])
		end
		
		@list_tab = 'searchlead'
	end
	
	def edit
		@lead = Lead.find(params[:id])
		@list_tab = 'searchlead'
	end
	
	def update
		@lead = Lead.find(params[:id])
		if @lead.update_attributes(lead_params)
			flash[:success] = "Lead updated"
			redirect_to lead_path(@lead)
		else
			flash[:danger] = "Lead could not be updated"
			render 'edit'
		end
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
