module ListsHelper
	def listtab_active(current_tab,list_tab)
		active_snippet = 'class="active"'
		if list_tab == current_tab
			active_snippet.to_s.html_safe
		else
			""
		end	
	end
end
