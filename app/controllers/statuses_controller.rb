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
		@statuses = Status.all
		if params[:status_selectable] == 'N'
			@status = Status.find(params[:status])
			@status.update_attribute(:selectable, "Y")
			redirect_to edit_status_path()
		elsif params[:status_selectable] == 'Y'
			@status = Status.find(params[:status])
			@status.update_attribute(:selectable, "N")
			redirect_to edit_status_path()
		end
                if params[:status_human_answered] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:human_answered, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_human_answered] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:human_answered, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_sale] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:sale, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_sale] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:sale, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_dnc] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:dnc, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_dnc] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:dnc, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_customer_contact] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:customer_contact, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_customer_contact] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:customer_contact, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_not_interested] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:not_interested, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_not_interested] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:not_interested, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_unworkable] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:unworkable, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_unworkable] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:unworkable, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_scheduled_callback] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:scheduled_callback, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_scheduled_callback] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:scheduled_callback, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_completed] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:completed, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_completed] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:completed, "N")
                        redirect_to edit_status_path()
                end
                if params[:status_selectable] == 'N'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:selectable, "Y")
                        redirect_to edit_status_path()
                elsif params[:status_selectable] == 'Y'
                        @status = Status.find(params[:status])
                        @status.update_attribute(:selectable, "N")
                        redirect_to edit_status_path()
                end
	end
	private
	
		def sort_column
			Status.column_names.include?(params[:sort]) ? params[:sort] : "id"
		end
	
		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
end
