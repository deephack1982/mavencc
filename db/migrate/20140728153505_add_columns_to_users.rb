class AddColumnsToUsers < ActiveRecord::Migration
  def change
	change_table :users do |t|
		t.column :delete_users, "ENUM('0','1')"
                t.column :delete_user_groups, "ENUM('0','1')"
                t.column :alert_enabled, "ENUM('0','1')"
                t.column :download_lists, "ENUM('0','1')"
                t.column :agent_shift_enforcement_override, "ENUM('DISABLED','OFF','START','ALL')"
                t.column :manager_shift_enforcement_override, "ENUM('0','1')"
                t.column :shift_override_flag, "ENUM('0','1')"
                t.column :export_reports, "ENUM('0','1')"
                t.column :delete_from_dnc, "ENUM('0','1')"
                t.string :email, "ENUM('0','1')", :limit => 100
                t.string :user_code, :limit => 100
                t.string :territory, :limit => 100
                t.column :allow_alerts, "ENUM('0','1')"
                t.column :agent_choose_territories, "ENUM('0','1')"
                t.string :custom_one, :limit => 100
                t.string :custom_two, :limit => 100
                t.string :custom_three, :limit => 100
                t.string :custom_four, :limit => 100
                t.string :custom_five, :limit => 100
                t.string :voicemail_id, :limit => 10
                t.column :agent_call_log_view_override, "ENUM('DISABLED','Y','N')"
                t.column :callcard_admin, "ENUM('0','1')"
                t.column :agent_choose_blended, "ENUM('0','1')"
                t.column :realtime_block_user_info, "ENUM('0','1')"
                t.column :custom_fields_modify, "ENUM('0','1')"
                t.column :force_change_password, "ENUM('0','1')"
                t.column :agent_lead_search_override, "ENUM('NOT_ACTIVE','ENABLED','LIVE_CALL_INBOUND','LIVE_CALL_INBOUND_AND_MANUAL','DISABLED')"
                t.column :modify_shifts, "ENUM('0','1')"
                t.column :modify_phones, "ENUM('0','1')"
                t.column :modify_carriers, "ENUM('0','1')"
                t.column :modify_labels, "ENUM('0','1')"
                t.column :modify_statuses, "ENUM('0','1')"
                t.column :modify_voicemail, "ENUM('0','1')"
                t.column :modify_audiostore, "ENUM('0','1')"
                t.column :modify_moh, "ENUM('0','1')"
                t.column :modify_tts, "ENUM('0','1')"
                t.column :preset_contact_search, "ENUM('NOT_ACTIVE','ENABLED','DISABLED')"
                t.column :modify_contacts, "ENUM('0','1')"
                t.column :modify_same_user_level, "ENUM('0','1')"
                t.column :admin_hide_lead_data, "ENUM('0','1')"
                t.column :admin_hide_phone_data, "ENUM('0','1','2_DIGITS','3_DIGITS','4_DIGITS')"
                t.column :agentcall_email, "ENUM('0','1')"
                t.column :modify_email_accounts, "ENUM('0','1')"
                t.integer :failed_login_count, :limit => 1
		t.datetime :last_login_date
		t.string :last_ip, :limit => 15
		t.string :pass_hash, :limit => 100
		t.column :alter_admin_interface_options, "ENUM('0','1')"
		t.integer :max_inbound_calls, :limit => 2
		t.column :modify_custom_dialplans, "ENUM('0','1')"
		t.integer :wrapup_seconds_override, :limit => 2
	end
  end
end
