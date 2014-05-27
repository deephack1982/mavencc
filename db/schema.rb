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

ActiveRecord::Schema.define(version: 20140527111722) do

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
  end

  create_table "list", force: true do |t|
    t.integer  "lead_id"
    t.string   "status"
    t.string   "user"
    t.string   "vendor_lead_code"
    t.string   "source_id"
    t.integer  "lists_id"
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

  add_index "list", ["lists_id"], name: "index_list_on_lists_id", using: :btree

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
