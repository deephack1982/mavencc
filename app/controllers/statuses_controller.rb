class StatusesController < ApplicationController
	helper_method :sort_column, :sort_direction

	before_filter :authorise

	def index
		@admin_tab = 'status'
		@statuses = Status.order(sort_column + " " + sort_direction)
	end
	
	def show
		@admin_tab = 'status'
		@status = Status.find(params[:id])
	end

	def edit
		@yn_attributes = [ "selectable","human_answered","sale","dnc","customer_contact","not_interested","unworkable","scheduled_callback","completed","selectable" ]
		@statuses = Status.order(sort_column + " " + sort_direction)
		@yn_attributes.each do |attribute|
			flip_status_attribute("#{attribute}")
		end
	end
	private
	
		def sort_column
			Status.column_names.include?(params[:sort]) ? params[:sort] : "id"
		end
	
		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
		
		def flip_status_attribute(attribute)
			if params[:"status_#{attribute}"] == 'N'
				@status = Status.find(params[:status])
				@status.update_attribute(:"#{attribute}", "Y")
				redirect_to edit_status_path()
				#render
			elsif params[:"status_#{attribute}"] == 'Y'
				@status = Status.find(params[:status])
				@status.update_attribute(:"#{attribute}", "N")
				redirect_to edit_status_path()
				#render
			end
	        end
end
