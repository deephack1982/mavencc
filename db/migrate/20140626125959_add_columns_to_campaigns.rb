class AddColumnsToCampaigns < ActiveRecord::Migration
  def change
  	change_table :campaigns do |t|
  		t.string :dial_status_a, :limit => 6
		t.string :dial_status_b, :limit => 6
		t.string :dial_status_c, :limit => 6
		t.string :dial_status_d, :limit => 6
		t.string :dial_status_e, :limit => 6
		t.string :lead_order, :limit => 30
		t.string :park_ext, :limit => 10
		t.string :park_file_name, :limit => 100
		t.text :web_form_address
		t.column :allow_closers, "ENUM('Y','N')"
		t.integer :hopper_level
		t.string :auto_dial_level
		t.column :next_agent_call, "ENUM('random','oldest_call_start','oldest_call_finish','campaign_rank','overall_user_level','fewest_calls','longest_wait_time','campaign_grade_random')"
		t.string :local_call_time, :limit => 10
		t.string :voicemail_ext, :limit => 10
		t.integer :dial_timeout
		t.string :dial_prefix, :limit => 20
		t.string :campaign_cid, :limit => 20
		t.string :campaign_vdad_exten, :limit => 20
		t.string :campaign_rec_exten, :limit => 20
		t.column :campaign_recording, "ENUM('NEVER','ONDEMAND','ALLCALLS','ALLFORCE')"
		t.string :campaign_rec_filename, :limit => 50
		t.string :campaign_script, :limit => 10
		t.column :get_call_launch, "ENUM('NONE','SCRIPT','WEBFORM','WEBFORMTWO','FORM')"
		t.string :am_message_exten, :limit => 100
		t.column :amd_send_to_vmx, "ENUM('Y','N')"
		t.string :xferconf_a_dtmf, :limit => 50
		t.string :xferconf_a_number, :limit => 50
		t.string :xferconf_b_dtmf, :limit => 50
		t.string :xferconf_b_number, :limit => 50
		t.column :alt_number_dialing, "ENUM('N','Y','SELECTED','SELECTED_TIMER_ALT','SELECTED_TIMER_ADDR3')"
		t.column :scheduled_callbacks, "ENUM('Y','N')"
		t.string :lead_filter_id, :limit => 10
		t.integer :drop_call_seconds
		t.column :drop_action, "ENUM('HANGUP','MESSAGE','VOICEMAIL','IN_GROUP','AUDIO','CALLMENU','VMAIL_NO_INST')"
		t.string :safe_harbor_exten, :limit => 20
		t.column :display_dialable_count, "ENUM('Y','N')"
		t.integer :wrapup_seconds
		t.string :wrapup_message
		t.text :closer_campaigns
		t.column :use_internal_dnc, "ENUM('Y','N','AREACODE')"
		t.integer :allcalls_delay
		t.column :omit_phone_code, "ENUM('Y','N')"
		t.column :dial_method, "ENUM('MANUAL','RATIO','ADAPT_HARD_LIMIT','ADAPT_TAPERED','ADAPT_AVERAGE','INBOUND_MAN')"
		t.column :available_only_ratio_tally, "ENUM('Y','N')"
		t.string :adaptive_dropped_percentage, :limit => 4
		t.string :adaptive_maximum_level, :limit => 6
		t.string :adaptive_latest_server_time, :limit => 4
		t.string :adaptive_intensity, :limit => 6
		t.integer :adaptive_dl_diff_target
		t.column :concurrent_transfers, "ENUM('AUTO','1','2','3','4','5','6','7','8','9','10','15','20','25','30','40','50','60','80','100')"
		t.column :auto_alt_dial, "ENUM('NONE','ALT_ONLY','ADDR3_ONLY','ALT_AND_ADDR3','ALT_AND_EXTENDED','ALT_AND_ADDR3_AND_EXTENDED','EXTENDED_ONLY','MULTI_LEAD')"
		t.string :auto_alt_dial_statuses
		t.column :agent_pause_codes_active, "ENUM('Y','N','FORCE')"
		t.column :campaign_stats_refresh, "ENUM('Y','N')"
		t.string :dial_statuses
		t.column :disable_alter_custdata, "ENUM('Y','N')"
		t.column :no_hopper_leads_logins, "ENUM('Y','N')"
		t.string :list_order_mix, :limit => 20
		t.column :campaign_allow_inbound, "ENUM('Y','N')"
		t.integer :manual_dial_list_id
		t.string :default_xfer_group, :limit => 20
		t.text :xfer_groups
		t.integer :queue_priority
		t.string :drop_inbound_group, :limit => 20
		t.column :qc_enabled, "ENUM('Y','N')"
		t.text :qc_statuses
		t.text :qc_lists
		t.string :qc_shift_id, :limit => 20
		t.column :qc_get_record_launch, "ENUM('NONE','SCRIPT','WEBFORM','QCSCRIPT','QCWEBFORM')"
		t.column :qc_show_recording, "ENUM('Y','N')"
		t.string :qc_web_form_address
		t.string :qc_script, :limit => 10
		t.string :survey_first_audio_file, :limit => 50
		t.string :survey_dtmf_digits, :limit => 16
		t.string :survey_ni_digit, :limit => 1
		t.string :survey_opt_in_audio_file, :limit => 50
		t.string :survey_ni_audio_file, :limit => 50
		t.column :survey_method, "ENUM('AGENT_XFER','VOICEMAIL','EXTENSION','HANGUP','CAMPREC_60_WAV','CALLMENU','VMAIL_NO_INST')"
		t.column :survey_no_response_action, "ENUM('OPTIN','OPTOUT','DROP')"
		t.string :survey_ni_status, :limit => 6
		t.string :survey_response_digit_map
		t.string :survey_xfer_exten, :limit => 20
		t.string :survey_camp_record_dir
		t.column :disable_alter_custphone, "ENUM('Y','N','HIDE')"
		t.column :display_queue_count, "ENUM('Y','N')"
		t.string :manual_dial_filter, :limit => 50
		t.string :agent_clipboard_copy, :limit => 50
		t.column :agent_extended_alt_dial, "ENUM('Y','N')"
		t.column :use_campaign_dnc, "ENUM('Y','N','AREACODE')"
		t.column :three_way_call_cid, "ENUM('CAMPAIGN','CUSTOMER','AGENT_PHONE','AGENT_CHOOSE','CUSTOM_CID')"
		t.string :three_way_dial_prefix, :limit => 20
		t.string :web_form_target, :limit => 100
		t.string :vtiger_search_category, :limit => 100
		t.column :vtiger_create_call_record, "ENUM('Y','N','DISPO')"
		t.column :vtiger_create_lead_record, "ENUM('Y','N')"
		t.column :vtiger_screen_login, "ENUM('Y','N','NEW_WINDOW')"
		t.column :cpd_amd_action, "ENUM('DISABLED','DISPO','MESSAGE','CALLMENU','INGROUP')"
		t.column :agent_allow_group_alias, "ENUM('Y','N')"
		t.string :default_group_alias, :limit => 30
		t.column :vtiger_search_dead, "ENUM('DISABLED','ASK','RESURRECT')"
		t.column :vtiger_status_call, "ENUM('Y','N')"
		t.string :survey_third_digit, :limit => 1
		t.string :survey_third_audio_file, :limit => 50
		t.string :survey_third_status, :limit => 6
		t.string :survey_third_exten, :limit => 20
		t.string :survey_fourth_digit, :limit => 1
		t.string :survey_fourth_audio_file, :limit => 50
		t.string :survey_fourth_status, :limit => 6
		t.string :survey_fourth_exten, :limit => 20
		t.string :drop_lockout_time, :limit => 6
		t.string :quick_transfer_button, :limit => 20
		t.column :prepopulate_transfer_preset, "ENUM('N','PRESET_1','PRESET_2','PRESET_3','PRESET_4','PRESET_5')"
		t.string :drop_rate_group, :limit => 20
		t.column :view_calls_in_queue, "ENUM('NONE','ALL','1','2','3','4','5')"
		t.column :view_calls_in_queue_launch, "ENUM('AUTO','MANUAL')"
		t.column :grab_calls_in_queue, "ENUM('Y','N')"
		t.column :call_requeue_button, "ENUM('Y','N')"
		t.column :pause_after_each_call, "ENUM('Y','N')"
		t.column :no_hopper_dialing, "ENUM('Y','N')"
		t.column :agent_dial_owner_only, "ENUM('NONE','USER','TERRITORY','USER_GROUP','USER_BLANK','TERRITORY_BLANK','USER_GROUP_BLANK')"
		t.column :agent_display_dialable_leads, "ENUM('Y','N')"
		t.text :web_form_address_two
		t.string :waitforsilence_options, :limit => 25
		t.column :agent_select_territories, "ENUM('Y','N')"
		t.datetime :campaign_calldate
		t.column :crm_popup_login, "ENUM('Y','N')"
		t.text :crm_login_address
		t.string :timer_action, :limit => 20
		t.string :timer_action_message
		t.integer :timer_action_seconds
		t.text :start_call_url
		t.text :dispo_call_url
		t.string :xferconf_c_number, :limit => 50
		t.string :xferconf_d_number, :limit => 50
		t.string :xferconf_e_number, :limit => 50
		t.column :use_custom_cid, "ENUM('Y','N','AREACODE')"
		t.column :scheduled_callbacks_alert, "ENUM('NONE','BLINK','RED','BLINK_RED','BLINK_DEFER','RED_DEFER','BLINK_RED_DEFER')"
		t.column :queuemetrics_callstatus_override, "ENUM('DISABLED','NO','YES')"
		t.column :extension_appended_cidname, "ENUM('Y','N')"
		t.column :scheduled_callbacks_count, "ENUM('LIVE','ALL_ACTIVE')"
		t.column :manual_dial_override, "ENUM('NONE','ALLOW_ALL','DISABLE_ALL')"
		t.column :blind_monitor_warning, "ENUM('DISABLED','ALERT','NOTICE','AUDIO','ALERT_NOTICE','ALERT_AUDIO','NOTICE_AUDIO','ALL')"
		t.string :blind_monitor_message
		t.string :blind_monitor_filename, :limit => 100
		t.column :inbound_queue_no_dial, "ENUM('DISABLED','ENABLED','ALL_SERVERS')"
		t.string :timer_action_destination, :limit => 30
		t.column :enable_xfer_presets, "ENUM('DISABLED','ENABLED','CONTACTS')"
		t.column :hide_xfer_number_to_dial, "ENUM('DISABLED','ENABLED')"
		t.string :manual_dial_prefix, :limit => 20
		t.column :customer_3way_hangup_logging, "ENUM('DISABLED','ENABLED')"
		t.integer :customer_3way_hangup_seconds
		t.column :customer_3way_hangup_action, "ENUM('NONE','DISPO')"
		t.column :ivr_park_call, "ENUM('DISABLED','ENABLED','ENABLED_PARK_ONLY','ENABLED_BUTTON_HIDDEN')"
		t.text :ivr_park_call_agi
		t.column :manual_preview_dial, "ENUM('DISABLED','PREVIEW_AND_SKIP','PREVIEW_ONLY')"
		t.column :realtime_agent_time_stats, "ENUM('DISABLED','WAIT_CUST_ACW','WAIT_CUST_ACW_PAUSE','CALLS_WAIT_CUST_ACW_PAUSE')"
		t.column :use_auto_hopper, "ENUM('Y','N')"
		t.string :auto_hopper_multi, :limit => 6
		t.integer :auto_hopper_level
		t.column :auto_trim_hopper, "ENUM('Y','N')"
		t.column :api_manual_dial, "ENUM('STANDARD','QUEUE','QUEUE_AND_AUTOCALL')"
		t.column :manual_dial_call_time_check, "ENUM('DISABLED','ENABLED')"
		t.column :display_leads_count, "ENUM('Y','N')"
		t.column :lead_order_randomize, "ENUM('Y','N')"
		t.column :lead_order_secondary, "ENUM('LEAD_ASCEND','LEAD_DESCEND','CALLTIME_ASCEND','CALLTIME_DESCEND')"
		t.column :per_call_notes, "ENUM('ENABLED','DISABLED')"
		t.column :my_callback_option, "ENUM('CHECKED','UNCHECKED')"
		t.column :agent_lead_search, "ENUM('ENABLED','LIVE_CALL_INBOUND','LIVE_CALL_INBOUND_AND_MANUAL','DISABLED')"
		t.string :agent_lead_search_method, :limit => 30
		t.string :queuemetrics_phone_environment, :limit => 20
		t.column :auto_pause_precall, "ENUM('Y','N')"
		t.string :auto_pause_precall_code, :limit => 6
		t.column :auto_resume_precall, "ENUM('Y','N')"
		t.column :manual_dial_cid, "ENUM('CAMPAIGN','AGENT_PHONE')"
		t.string :post_phone_time_diff_alert, :limit => 30
		t.string :custom_3way_button_transfer, :limit => 30
		t.column :available_only_tally_threshold, "ENUM('DISABLED','LOGGED-IN_AGENTS','NON-PAUSED_AGENTS','WAITING_AGENTS')"
		t.integer :available_only_tally_threshold_agents
		t.column :dial_level_threshold, "ENUM('DISABLED','LOGGED-IN_AGENTS','NON-PAUSED_AGENTS','WAITING_AGENTS')"
		t.integer :dial_level_threshold_agents
		t.string :safe_harbor_audio, :limit => 100
		t.string :safe_harbor_menu_id, :limit => 50
		t.string :survey_menu_id, :limit => 50
		t.integer :callback_days_limit
		t.column :dl_diff_target_method, "ENUM('ADAPT_CALC_ONLY','CALLS_PLACED')"
		t.column :disable_dispo_screen, "ENUM('DISPO_ENABLED','DISPO_DISABLED','DISPO_SELECT_DISABLED')"
		t.string :disable_dispo_status, :limit => 6
		t.string :screen_labels, :limit => 20
		t.string :status_display_fields, :limit => 30
		t.text :na_call_url
		t.column :survey_recording, "ENUM('Y','N','Y_WITH_AMD')"
		t.column :pllb_grouping, "ENUM('DISABLED','ONE_SERVER_ONLY','CASCADING')"
		t.integer :pllb_grouping_limit
		t.integer :call_count_limit
		t.integer :call_count_target
		t.integer :callback_hours_block
		t.column :callback_list_calltime, "ENUM('ENABLED','DISABLED')"
		t.column :hopper_vlc_dup_check, "ENUM('Y','N')"
		t.column :in_group_dial, "ENUM('DISABLED','MANUAL_DIAL','NO_DIAL','BOTH')"
		t.column :in_group_dial_select, "ENUM('AGENT_SELECTED','CAMPAIGN_SELECTED','ALL_USER_GROUP')"
		t.string :safe_harbor_audio_field
		t.column :pause_after_next_call, "ENUM('ENABLED','DISABLED')"
		t.column :owner_populate, "ENUM('ENABLED','DISABLED')"
		t.string :use_other_campaign_dnc, :limit => 8
		t.column :allow_emails, "ENUM('Y','N')"
		t.string :amd_inbound_group, :limit => 20
		t.string :amd_callmenu, :limit => 50
		t.integer :survey_wait_sec
		t.column :manual_dial_lead_id, "ENUM('Y','N')"
		t.integer :dead_max
		t.string :dead_max_dispo, :limit => 6
		t.integer :dispo_max
		t.string :dispo_max_dispo, :limit => 6
		t.integer :pause_max
		t.integer :max_inbound_calls
		t.column :manual_dial_search_checkbox, "ENUM('SELECTED','SELECTED_RESET','UNSELECTED','UNSELECTED_RESET')"
		t.column :hide_call_log_info, "ENUM('Y','N')"
		t.integer :timer_alt_seconds
	end
  end
end
