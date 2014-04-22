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
		title ||= column.titleize
		sort = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, :sort => column, :direction => direction
	end
end
