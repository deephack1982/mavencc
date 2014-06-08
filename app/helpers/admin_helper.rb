module AdminHelper
	def admintab_active(current_tab,admin_tab)
		active_snippet = 'class="active"'
		if admin_tab == current_tab
			active_snippet.to_s.html_safe
		else
			""
		end	
	end
end
