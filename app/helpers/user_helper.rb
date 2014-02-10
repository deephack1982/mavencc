module UserHelper
	def usertab_active(current_tab,user_tab)
		active_snippet = 'class="active"'
		if user_tab == current_tab
			active_snippet.to_s.html_safe
		else
			""
		end	
	end
end
