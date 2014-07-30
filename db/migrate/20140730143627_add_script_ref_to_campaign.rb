class AddScriptRefToCampaign < ActiveRecord::Migration
  def change
  	add_reference :campaigns, :script, index: true
  end
end
