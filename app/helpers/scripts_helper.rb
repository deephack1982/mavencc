module ScriptsHelper
	def scripttab_active(current_tab,script_tab)
		active_snippet = 'class="active"'
		if script_tab == current_tab
			active_snippet.to_s.html_safe
		else
			""
		end	
	end
end
