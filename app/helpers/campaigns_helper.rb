module CampaignsHelper
	def campaigntab_active(current_tab,campaign_tab)
		active_snippet = 'class="active"'
		if campaign_tab == current_tab
			active_snippet.to_s.html_safe
		else
			""
		end	
	end
end
