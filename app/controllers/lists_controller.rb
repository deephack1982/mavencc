class ListsController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@lists = List.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
		@list_tab = 'list'
	end
	
	def show
		@list = List.find(params[:id])
		@list_tab = 'list'
		@statuses_in_list = Lead.where("list_id = ?","#{@list.id}").group(:status).count
		respond_to do |format|
			format.html do
				if params[:active] == 'Y'
					@list.update_attribute(:active, "N")
					redirect_to list_path(@list)
				elsif params[:active] == 'N'
					@list.update_attribute(:active, "Y")
					redirect_to list_path(@list)
				end
				
				if params[:reset] == 'Y'
					Lead.where(:list_id => @list.list_id).update_all(:called_since_last_reset => 'N')
					redirect_to list_path(@list)
				end 
			end
			format.csv do
				csv_file = ''
  				@leads = Lead.where("list_id = ?", "#{@list.id}")
			  	headings = ['lead_id','status','phone_number','title','first_name','last_name','address1','address2','address3','city','province','postal_code']
			  	headings.each do |c|
			  		csv_file << c << ','
			  	end
			  	csv_file.chomp(',')
			  	csv_file << "\n"
				@leads.each do |v|
					csv_file << v.lead_id.to_s << ','
					csv_file << v.status << ','
					csv_file << v.phone_number << ','
					csv_file << v.title << ','
					csv_file << v.first_name << ','
					csv_file << v.last_name << ','
					csv_file << v.address1 << ','
					csv_file << v.address2 << ','
					csv_file << v.address3 << ','
					csv_file << v.city << ','
					csv_file << v.province << ','
					csv_file << v.postal_code << ','
					csv_file.chomp(',')
					csv_file << "\n"
				end
				send_data csv_file
			end
		end
	end
	
	def new
		@list = List.new
		@list_tab = 'add'
	end
	
	def create
		@list = List.create(list_params)
		@list.id = @list.list_id
    	if @list.save
    		flash[:success] = "List created"
      		redirect_to list_path(@list)
    	else
    		flash[:danger] = "List could not be created"
      		render 'new'
    	end
	end
	
	def edit
		@list = List.find(params[:id])
		@list_tab = 'list'
	end
	
	def update
		@list = List.find(params[:id])
		if @list.update_attributes(list_params)
			flash[:success] = "List updated"
			@list.list_id = @list.id
			redirect_to list_path(@list)
		else
			flash[:danger] = "List could not be updated"
			render 'edit'
		end
	end
	
	def destroy
		@list = List.find(params[:id])
		@list.destroy
		
		respond_to do |format|
			format.js
			format.html do
				flash[:success] = "List Deleted"
				redirect_to lists_path
			end
			format.json
		end
	end
private
	
	def list_params
		params.require(:list).permit(:list_id,:list_name,:active,:list_description,:campaign_id,:reset_time)
	end
	
	def sort_column
		List.column_names.include?(params[:sort]) ? params[:sort] : "list_id"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
