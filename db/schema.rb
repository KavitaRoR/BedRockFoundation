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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120316031506) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.date     "started_on"
    t.integer  "cost_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_statuses", :force => true do |t|
    t.string   "status_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "company"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "phone_alt"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "province"
    t.integer  "zip"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lat"
    t.string   "lng"
    t.integer  "distance"
    t.string   "phone_work"
    t.string   "email"
    t.integer  "contact_status_id", :default => 1, :null => false
    t.integer  "shed_company_id"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "estimate_id"
    t.integer  "crew_id"
    t.datetime "scheduled_date"
    t.integer  "position_in_day"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "crews", :force => true do |t|
    t.string   "crew_name"
    t.string   "crew_base_address"
    t.string   "lat"
    t.string   "lng"
    t.integer  "crew_size"
    t.integer  "velocity"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "job_max_per_day",   :default => 3
  end

  create_table "estimates", :force => true do |t|
    t.integer  "job_id"
    t.integer  "job_type_id"
    t.text     "flashvars"
    t.datetime "date_of_email_to_client"
    t.string   "token"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "sold",                    :default => false
  end

  create_table "foundations", :force => true do |t|
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "job_types", :force => true do |t|
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.text     "description"
    t.datetime "originally_scheduled_at"
    t.datetime "current_scheduled_at"
    t.integer  "duration_in_minutes"
    t.integer  "price_in_cents"
    t.integer  "material_cost_in_cents"
    t.integer  "labor_cost_in_cents"
    t.integer  "foundation_id"
    t.integer  "pad_size_id"
    t.string   "door_placement"
    t.integer  "off_level_amount_in_inches"
    t.integer  "truck_id"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "province"
    t.integer  "zip"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lat"
    t.string   "lng"
    t.integer  "distance"
    t.integer  "width"
    t.integer  "length"
    t.decimal  "additional_price",           :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "depth",                      :precision => 10, :scale => 0
    t.string   "shed_company"
    t.string   "accessible_with_machine"
    t.string   "additional_fill_dirt"
    t.string   "build_up_timbers"
    t.string   "timber_wall"
    t.string   "economy_or_elite"
    t.boolean  "border_sixbysix",                                           :default => false
    t.decimal  "discount",                   :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.string   "crew_name"
    t.string   "rig_name"
    t.integer  "location_id"
    t.integer  "job_type_id",                                               :default => 1
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "next_actions", :force => true do |t|
    t.string   "name"
    t.boolean  "requires_phone_call"
    t.boolean  "on_hold"
    t.boolean  "requires_visit"
    t.boolean  "requires_research"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "pad_jobs", :force => true do |t|
    t.integer  "job_id"
    t.integer  "foundation_id"
    t.integer  "pad_size_id"
    t.string   "door_placement"
    t.integer  "off_level_amount_in_inches"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pad_sizes", :force => true do |t|
    t.integer  "length"
    t.integer  "width"
    t.integer  "price_in_cents"
    t.integer  "material_cost_in_cents"
    t.integer  "labor_cost_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "rock_pad_variables", :force => true do |t|
    t.string   "key"
    t.decimal  "value",       :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "schedule_days", :force => true do |t|
    t.string   "day"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.integer  "job_id"
    t.integer  "next_action_id"
    t.text     "notes"
    t.integer  "assigned_by"
    t.integer  "assigned_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "done"
    t.integer  "contact_id"
    t.datetime "followup_date"
  end

  create_table "trucks", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crew_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                                 :null => false
    t.string   "encrypted_password",                    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
