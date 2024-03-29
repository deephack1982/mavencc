module ApplicationHelper
	def full_title(page_title)
		base_title = "Maven CC"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	
	def sortable(column, title = nil)
		output = '>'
		sort_snippet = 'class="info">'
		direction_up_snippet = ' <span class="glyphicon glyphicon-chevron-up"></span>'
		direction_down_snippet = ' <span class="glyphicon glyphicon-chevron-down"></span>'
		if column == params[:sort]
			output = sort_snippet.to_s.html_safe
		end
		title ||= column.titleize
		sort = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		output << link_to(title, :sort => column, :direction => direction).to_s.html_safe
		if column == params[:sort]
			if params[:direction] == "asc"
				output << direction_up_snippet.to_s.html_safe
			elsif params[:direction] == "desc"
				output << direction_down_snippet.to_s.html_safe
			end
		end
		output.to_s.html_safe
	end
	
	def current_nav(current_nav)
		nav_snippet = 'class="active"'
		if current_nav == controller.controller_name
			nav_snippet.to_s.html_safe
		end
	end
	
	def mavencc_version
		data = File.read(File.join(Rails.root,"VERSION"))
		version = data.strip
		"Version " << version
	end		
	
	def item_active(active_item)
		if active_item == 'Y'
			snippet = "label-success"
			snippet.to_s.html_safe
		elsif active_item == 'N'
			snippet = "label-danger"
			snippet.to_s.html_safe
		end
	end
end
