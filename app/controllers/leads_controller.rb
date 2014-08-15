class LeadsController < ApplicationController
	helper_method :sort_column, :sort_direction, :status_name_lookup, :row_colour
	
	before_filter :authorise
	
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
		redirect_to lead_path(@lead), :success => "Lead created"
	else
		flash[:danger] = "Lead could not be created"
		render 'new'
	end
	end
	
	def search
		if params[:search_type] == "Phone"
			@leads = Lead.search_by_phone(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		elsif params[:search_type] == "Postcode"
			@leads = Lead.search_by_postcode(params[:search])
			@leads = @leads.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		else
			@leads = Lead.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
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
			redirect_to lead_path(@lead), :success => "Lead updated"
		else
			flash[:danger] = "Lead could not be updated"
			render 'edit'
		end
	end
	
	def loader
		@list_tab = 'loader'
	end
	
	def receipt
		@list_tab = 'loader'
		@receipt = Lead.import(params[:file],params[:list],params[:duplicate_check],params[:number_validation])
                flash[:success] = "Leads loaded, Good : #{@receipt[:flash]["loaded"]}, Duplicates : #{@receipt[:flash]["duplicates"]}, Invalid : #{@receipt[:flash]["invalid"]}"
		def receipt_csv
			require 'csv'
			CSV.open("receipt.csv", "wb") { |csv| @receipt[:data].to_a.each {|elem| csv << elem} }
		end
	end
	
	def csv
		require 'csv'
		CSV.open("receipt.csv", "wb") { |csv| @receipt[:data].to_a.each {|elem| csv << elem} }
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
	
	def status_name_lookup(status)
		Status.find_by_status(status).status_name
	end

	def row_colour(issue)
		if issue == "duplicate found"
			@snippet = ' class="warning"'
		else
			@snippet = ' class="danger"'
		end
		@snippet.to_s.html_safe
	end
end
