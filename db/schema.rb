# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140626125959) do

  create_table "campaigns", force: true do |t|
    t.string   "campaign_id"
    t.string   "campaign_name"
    t.string   "campaign_description"
    t.string   "active"
    t.datetime "campaign_changedate"
    t.datetime "campaign_logindate"
    t.string   "user_group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dial_status_a",                         limit: 6
    t.string   "dial_status_b",                         limit: 6
    t.string   "dial_status_c",                         limit: 6
    t.string   "dial_status_d",                         limit: 6
    t.string   "dial_status_e",                         limit: 6
    t.string   "lead_order",                            limit: 30
    t.string   "park_ext",                              limit: 10
    t.string   "park_file_name",                        limit: 100
    t.text     "web_form_address"
    t.string   "allow_closers",                         limit: 1
    t.integer  "hopper_level"
    t.string   "auto_dial_level"
    t.string   "next_agent_call",                       limit: 21
    t.string   "local_call_time",                       limit: 10
    t.string   "voicemail_ext",                         limit: 10
    t.integer  "dial_timeout"
    t.string   "dial_prefix",                           limit: 20
    t.string   "campaign_cid",                          limit: 20
    t.string   "campaign_vdad_exten",                   limit: 20
    t.string   "campaign_rec_exten",                    limit: 20
    t.string   "campaign_recording",                    limit: 8
    t.string   "campaign_rec_filename",                 limit: 50
    t.string   "campaign_script",                       limit: 10
    t.string   "get_call_launch",                       limit: 10
    t.string   "am_message_exten",                      limit: 100
    t.string   "amd_send_to_vmx",                       limit: 1
    t.string   "xferconf_a_dtmf",                       limit: 50
    t.string   "xferconf_a_number",                     limit: 50
    t.string   "xferconf_b_dtmf",                       limit: 50
    t.string   "xferconf_b_number",                     limit: 50
    t.string   "alt_number_dialing",                    limit: 20
    t.string   "scheduled_callbacks",                   limit: 1
    t.string   "lead_filter_id",                        limit: 10
    t.integer  "drop_call_seconds"
    t.string   "drop_action",                           limit: 13
    t.string   "safe_harbor_exten",                     limit: 20
    t.string   "display_dialable_count",                limit: 1
    t.integer  "wrapup_seconds"
    t.string   "wrapup_message"
    t.text     "closer_campaigns"
    t.string   "use_internal_dnc",                      limit: 8
    t.integer  "allcalls_delay"
    t.string   "omit_phone_code",                       limit: 1
    t.string   "dial_method",                           limit: 16
    t.string   "available_only_ratio_tally",            limit: 1
    t.string   "adaptive_dropped_percentage",           limit: 4
    t.string   "adaptive_maximum_level",                limit: 6
    t.string   "adaptive_latest_server_time",           limit: 4
    t.string   "adaptive_intensity",                    limit: 6
    t.integer  "adaptive_dl_diff_target"
    t.string   "concurrent_transfers",                  limit: 4
    t.string   "auto_alt_dial",                         limit: 26
    t.string   "auto_alt_dial_statuses"
    t.string   "agent_pause_codes_active",              limit: 5
    t.string   "campaign_stats_refresh",                limit: 1
    t.string   "dial_statuses"
    t.string   "disable_alter_custdata",                limit: 1
    t.string   "no_hopper_leads_logins",                limit: 1
    t.string   "list_order_mix",                        limit: 20
    t.string   "campaign_allow_inbound",                limit: 1
    t.integer  "manual_dial_list_id"
    t.string   "default_xfer_group",                    limit: 20
    t.text     "xfer_groups"
    t.integer  "queue_priority"
    t.string   "drop_inbound_group",                    limit: 20
    t.string   "qc_enabled",                            limit: 1
    t.text     "qc_statuses"
    t.text     "qc_lists"
    t.string   "qc_shift_id",                           limit: 20
    t.string   "qc_get_record_launch",                  limit: 9
    t.string   "qc_show_recording",                     limit: 1
    t.string   "qc_web_form_address"
    t.string   "qc_script",                             limit: 10
    t.string   "survey_first_audio_file",               limit: 50
    t.string   "survey_dtmf_digits",                    limit: 16
    t.string   "survey_ni_digit",                       limit: 1
    t.string   "survey_opt_in_audio_file",              limit: 50
    t.string   "survey_ni_audio_file",                  limit: 50
    t.string   "survey_method",                         limit: 14
    t.string   "survey_no_response_action",             limit: 6
    t.string   "survey_ni_status",                      limit: 6
    t.string   "survey_response_digit_map"
    t.string   "survey_xfer_exten",                     limit: 20
    t.string   "survey_camp_record_dir"
    t.string   "disable_alter_custphone",               limit: 4
    t.string   "display_queue_count",                   limit: 1
    t.string   "manual_dial_filter",                    limit: 50
    t.string   "agent_clipboard_copy",                  limit: 50
    t.string   "agent_extended_alt_dial",               limit: 1
    t.string   "use_campaign_dnc",                      limit: 8
    t.string   "three_way_call_cid",                    limit: 12
    t.string   "three_way_dial_prefix",                 limit: 20
    t.string   "web_form_target",                       limit: 100
    t.string   "vtiger_search_category",                limit: 100
    t.string   "vtiger_create_call_record",             limit: 5
    t.string   "vtiger_create_lead_record",             limit: 1
    t.string   "vtiger_screen_login",                   limit: 10
    t.string   "cpd_amd_action",                        limit: 8
    t.string   "agent_allow_group_alias",               limit: 1
    t.string   "default_group_alias",                   limit: 30
    t.string   "vtiger_search_dead",                    limit: 9
    t.string   "vtiger_status_call",                    limit: 1
    t.string   "survey_third_digit",                    limit: 1
    t.string   "survey_third_audio_file",               limit: 50
    t.string   "survey_third_status",                   limit: 6
    t.string   "survey_third_exten",                    limit: 20
    t.string   "survey_fourth_digit",                   limit: 1
    t.string   "survey_fourth_audio_file",              limit: 50
    t.string   "survey_fourth_status",                  limit: 6
    t.string   "survey_fourth_exten",                   limit: 20
    t.string   "drop_lockout_time",                     limit: 6
    t.string   "quick_transfer_button",                 limit: 20
    t.string   "prepopulate_transfer_preset",           limit: 8
    t.string   "drop_rate_group",                       limit: 20
    t.string   "view_calls_in_queue",                   limit: 4
    t.string   "view_calls_in_queue_launch",            limit: 6
    t.string   "grab_calls_in_queue",                   limit: 1
    t.string   "call_requeue_button",                   limit: 1
    t.string   "pause_after_each_call",                 limit: 1
    t.string   "no_hopper_dialing",                     limit: 1
    t.string   "agent_dial_owner_only",                 limit: 16
    t.string   "agent_display_dialable_leads",          limit: 1
    t.text     "web_form_address_two"
    t.string   "waitforsilence_options",                limit: 25
    t.string   "agent_select_territories",              limit: 1
    t.datetime "campaign_calldate"
    t.string   "crm_popup_login",                       limit: 1
    t.text     "crm_login_address"
    t.string   "timer_action",                          limit: 20
    t.string   "timer_action_message"
    t.integer  "timer_action_seconds"
    t.text     "start_call_url"
    t.text     "dispo_call_url"
    t.string   "xferconf_c_number",                     limit: 50
    t.string   "xferconf_d_number",                     limit: 50
    t.string   "xferconf_e_number",                     limit: 50
    t.string   "use_custom_cid",                        limit: 8
    t.string   "scheduled_callbacks_alert",             limit: 15
    t.string   "queuemetrics_callstatus_override",      limit: 8
    t.string   "extension_appended_cidname",            limit: 1
    t.string   "scheduled_callbacks_count",             limit: 10
    t.string   "manual_dial_override",                  limit: 11
    t.string   "blind_monitor_warning",                 limit: 12
    t.string   "blind_monitor_message"
    t.string   "blind_monitor_filename",                limit: 100
    t.string   "inbound_queue_no_dial",                 limit: 11
    t.string   "timer_action_destination",              limit: 30
    t.string   "enable_xfer_presets",                   limit: 8
    t.string   "hide_xfer_number_to_dial",              limit: 8
    t.string   "manual_dial_prefix",                    limit: 20
    t.string   "customer_3way_hangup_logging",          limit: 8
    t.integer  "customer_3way_hangup_seconds"
    t.string   "customer_3way_hangup_action",           limit: 5
    t.string   "ivr_park_call",                         limit: 21
    t.text     "ivr_park_call_agi"
    t.string   "manual_preview_dial",                   limit: 16
    t.string   "realtime_agent_time_stats",             limit: 25
    t.string   "use_auto_hopper",                       limit: 1
    t.string   "auto_hopper_multi",                     limit: 6
    t.integer  "auto_hopper_level"
    t.string   "auto_trim_hopper",                      limit: 1
    t.string   "api_manual_dial",                       limit: 18
    t.string   "manual_dial_call_time_check",           limit: 8
    t.string   "display_leads_count",                   limit: 1
    t.string   "lead_order_randomize",                  limit: 1
    t.string   "lead_order_secondary",                  limit: 16
    t.string   "per_call_notes",                        limit: 8
    t.string   "my_callback_option",                    limit: 9
    t.string   "agent_lead_search",                     limit: 28
    t.string   "agent_lead_search_method",              limit: 30
    t.string   "queuemetrics_phone_environment",        limit: 20
    t.string   "auto_pause_precall",                    limit: 1
    t.string   "auto_pause_precall_code",               limit: 6
    t.string   "auto_resume_precall",                   limit: 1
    t.string   "manual_dial_cid",                       limit: 11
    t.string   "post_phone_time_diff_alert",            limit: 30
    t.string   "custom_3way_button_transfer",           limit: 30
    t.string   "available_only_tally_threshold",        limit: 17
    t.integer  "available_only_tally_threshold_agents"
    t.string   "dial_level_threshold",                  limit: 17
    t.integer  "dial_level_threshold_agents"
    t.string   "safe_harbor_audio",                     limit: 100
    t.string   "safe_harbor_menu_id",                   limit: 50
    t.string   "survey_menu_id",                        limit: 50
    t.integer  "callback_days_limit"
    t.string   "dl_diff_target_method",                 limit: 15
    t.string   "disable_dispo_screen",                  limit: 21
    t.string   "disable_dispo_status",                  limit: 6
    t.string   "screen_labels",                         limit: 20
    t.string   "status_display_fields",                 limit: 30
    t.text     "na_call_url"
    t.string   "survey_recording",                      limit: 10
    t.string   "pllb_grouping",                         limit: 15
    t.integer  "pllb_grouping_limit"
    t.integer  "call_count_limit"
    t.integer  "call_count_target"
    t.integer  "callback_hours_block"
    t.string   "callback_list_calltime",                limit: 8
    t.string   "hopper_vlc_dup_check",                  limit: 1
    t.string   "in_group_dial",                         limit: 11
    t.string   "in_group_dial_select",                  limit: 17
    t.string   "safe_harbor_audio_field"
    t.string   "pause_after_next_call",                 limit: 8
    t.string   "owner_populate",                        limit: 8
    t.string   "use_other_campaign_dnc",                limit: 8
    t.string   "allow_emails",                          limit: 1
    t.string   "amd_inbound_group",                     limit: 20
    t.string   "amd_callmenu",                          limit: 50
    t.integer  "survey_wait_sec"
    t.string   "manual_dial_lead_id",                   limit: 1
    t.integer  "dead_max"
    t.string   "dead_max_dispo",                        limit: 6
    t.integer  "dispo_max"
    t.string   "dispo_max_dispo",                       limit: 6
    t.integer  "pause_max"
    t.integer  "max_inbound_calls"
    t.string   "manual_dial_search_checkbox",           limit: 16
    t.string   "hide_call_log_info",                    limit: 1
    t.integer  "timer_alt_seconds"
  end

  create_table "list", force: true do |t|
    t.integer  "lead_id"
    t.string   "status"
    t.string   "user"
    t.string   "vendor_lead_code"
    t.string   "source_id"
    t.integer  "list_id"
    t.string   "called_since_last_reset"
    t.string   "phone_code"
    t.string   "phone_number"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country_code"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "alt_phone"
    t.string   "email"
    t.string   "security_phrase"
    t.text     "comments"
    t.integer  "called_count"
    t.datetime "last_local_call_time"
    t.integer  "rank"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list", ["list_id"], name: "index_list_on_list_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "list_id"
    t.string   "list_name"
    t.string   "list_description"
    t.integer  "campaign_id"
    t.string   "active"
    t.datetime "list_changedate"
    t.datetime "list_lastcalldate"
    t.string   "reset_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["campaign_id"], name: "index_lists_on_campaign_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "company"
    t.string   "site"
    t.string   "license_type"
    t.string   "license_code"
    t.text     "modules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_categories", force: true do |t|
    t.string   "vsc_id"
    t.string   "vsc_name"
    t.string   "vsc_description"
    t.string   "tovdad_display",     limit: 1
    t.string   "sale_category",      limit: 1
    t.string   "dead_lead_category", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "status"
    t.string   "status_name"
    t.string   "selectable",         limit: 1
    t.string   "human_answered",     limit: 1
    t.string   "category"
    t.string   "sale",               limit: 1
    t.string   "dnc",                limit: 1
    t.string   "customer_contact",   limit: 1
    t.string   "not_interested",     limit: 1
    t.string   "unworkable",         limit: 1
    t.string   "scheduled_callback", limit: 1
    t.string   "completed",          limit: 1
    t.integer  "status_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statuses", ["status_category_id"], name: "index_statuses_on_status_category_id", using: :btree

  create_table "user_groups", force: true do |t|
    t.string   "user_group"
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user"
    t.string   "pass"
    t.string   "full_name"
    t.integer  "user_level"
    t.string   "user_group"
    t.string   "phone_login"
    t.string   "phone_pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
