# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Site.create!(company: 'AREUK', site: 'Darlington', license_type: '20', license_code: 'testtesttest', modules: { 'AMD' => true, 'Recording' => true, 'CRM Integration' => false })
UserGroup.create!(user_group: 'Admins', group_name: 'Administrative Group')
UserGroup.create!(user_group: 'Operators', group_name: 'Operators group')
User.create!(user: 6666, pass: 'pepper1899', full_name: 'Administrator', user_level: 9, user_group: 'Admin', active: 'Y', password: 'pepper1899', password_confirmation: 'pepper1899', user_group_id: 1)
Campaign.create!(campaign_id: 'Test', campaign_name: 'Test Campaign', campaign_description: 'Test Campaign', active: 'N', lead_order: 'DOWN', hopper_level: '1', dial_method: 'MANUAL', auto_dial_level: 1, adaptive_intensity: 0, user_group: '1', dial_statuses: ' NEW ', campaign_script: 'NONE', script_id: 1)
CSV.foreach("#{::Rails.root}/lib/data/statuses.csv") do |row|
	Status.create!(status: row[0], status_name: row[1], selectable: row[2], human_answered: row[3], category: row[4], sale: row[5], dnc: row[6], customer_contact: row[7], not_interested: row[8], unworkable: row[9], scheduled_callback: row[10], completed: row[11])
end
StatusCategory.create!(vsc_id: 'UNDEFINED', vsc_name: 'Default Category', tovdad_display: 'N', sale_category: 'N', dead_lead_category: 'N')
Script.create!(script_id: 'NONE', script_name: 'NONE', script_comments: 'Default empty script', script_text: '', active: 'Y', user_group: 'Admins', user_group_id: 1)
Filter.create!(lead_filter_id: 'NONE', lead_filter_name: 'NONE', lead_filter_comments: 'Default empty filter', lead_filter_sql: '', user_group: 'Admins', user_group_id: 1)
