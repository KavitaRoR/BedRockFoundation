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

ActiveRecord::Schema.define(:version => 20131215235545) do

  create_table "arrival_ranges", :force => true do |t|
    t.string   "early"
    t.string   "late"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.date     "started_on"
    t.integer  "cost_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_payments", :force => true do |t|
    t.string   "check_number"
    t.decimal  "total",        :precision => 10, :scale => 2, :default => 0.0
    t.integer  "estimate_id"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
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
    t.integer  "created_by"
  end

  add_index "contacts", ["campaign_id"], :name => "index_contacts_on_campaign_id"
  add_index "contacts", ["contact_status_id"], :name => "index_contacts_on_contact_status_id"
  add_index "contacts", ["shed_company_id"], :name => "index_contacts_on_shed_company_id"

  create_table "content_data", :force => true do |t|
    t.string   "key"
    t.string   "description"
    t.text     "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contracts", :force => true do |t|
    t.integer  "estimate_id"
    t.integer  "crew_id"
    t.datetime "scheduled_date"
    t.integer  "position_in_day"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "arrival_range_id"
    t.datetime "marked_as_done_at"
    t.integer  "marked_as_done_by"
    t.integer  "rig_id"
    t.boolean  "called_day_before", :default => false
  end

  add_index "contracts", ["arrival_range_id"], :name => "index_contracts_on_arrival_range_id"
  add_index "contracts", ["crew_id"], :name => "index_contracts_on_crew_id"
  add_index "contracts", ["estimate_id"], :name => "index_contracts_on_estimate_id"

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
    t.integer  "ordering",          :default => 1
    t.string   "background_color"
    t.string   "border_color"
    t.string   "text_color"
  end

  create_table "day_crew_blocks", :force => true do |t|
    t.integer  "crew_id"
    t.string   "reason"
    t.datetime "day"
    t.integer  "contract_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.boolean  "block_off"
    t.integer  "working_with_crew_id"
  end

  add_index "day_crew_blocks", ["crew_id"], :name => "index_day_crew_blocks_on_crew_id"

  create_table "estimates", :force => true do |t|
    t.integer  "job_id"
    t.integer  "job_type_id",             :default => 2
    t.text     "flashvars"
    t.datetime "date_of_email_to_client"
    t.string   "token"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "sold",                    :default => false
    t.integer  "invoice_number"
    t.datetime "date_of_client_view"
    t.string   "off_level_to_show"
    t.boolean  "show_total_on_print",     :default => false
    t.boolean  "show_recurring_payment",  :default => false
    t.boolean  "show_payment_buttons",    :default => false
    t.text     "additional_notes"
    t.string   "firebase_token"
  end

  add_index "estimates", ["job_id"], :name => "index_estimates_on_job_id"
  add_index "estimates", ["job_type_id"], :name => "index_estimates_on_job_type_id"

  create_table "foundation_calculators", :force => true do |t|
    t.string   "kind"
    t.integer  "position"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "shortcode"
  end

  create_table "foundations", :force => true do |t|
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "job_additions", :force => true do |t|
    t.integer  "addition_price_in_cents"
    t.text     "addition_description"
    t.integer  "job_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "job_additions", ["job_id"], :name => "index_job_additions_on_job_id"

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
    t.decimal  "additional_price",                    :precision => 10, :scale => 2, :default => 0.0,        :null => false
    t.decimal  "depth",                               :precision => 10, :scale => 0
    t.string   "shed_company"
    t.string   "accessible_with_machine"
    t.string   "additional_fill_dirt"
    t.string   "build_up_timbers"
    t.string   "timber_wall"
    t.string   "economy_or_elite"
    t.boolean  "border_sixbysix",                                                    :default => false
    t.decimal  "discount",                            :precision => 10, :scale => 2, :default => 0.0,        :null => false
    t.string   "crew_name"
    t.string   "rig_name"
    t.integer  "location_id"
    t.integer  "job_type_id",                                                        :default => 1
    t.string   "off_level_fill_type",                                                :default => "Build-Up"
    t.integer  "erosion_control_lft"
    t.string   "trex_color"
    t.integer  "foundation_calculator_id",                                           :default => 1
    t.integer  "concrete_thickness_in_inches",                                       :default => 4
    t.integer  "concrete_edge_thickness_in_inches",                                  :default => 4
    t.boolean  "vapor_barrier",                                                      :default => true
    t.integer  "gravel_base_depth_in_inches",                                        :default => 4
    t.integer  "gibraltar_concrete_footer_in_inches",                                :default => 8
    t.integer  "days_on_job",                                                        :default => 1
    t.integer  "extra_man_days",                                                     :default => 1
    t.integer  "number_of_piers",                                                    :default => 4
    t.integer  "concrete_price_per_yard",                                            :default => 150
    t.integer  "concrete_piers_depth_in_inches",                                     :default => 32
    t.integer  "concrete_piers_diameter_in_inches",                                  :default => 16
    t.integer  "gibraltar_courses_of_block",                                         :default => 4
    t.text     "labor_schedule"
    t.integer  "calculation_location_id",                                            :default => 5
    t.integer  "wire_mesh_linear_feet",                                              :default => 0
    t.integer  "additional_buildup_labor",                                           :default => 0
    t.integer  "bundle_with_job_id"
    t.decimal  "area",                                :precision => 10, :scale => 2, :default => 0.0
    t.string   "job_status"
    t.text     "job_status_reason"
    t.decimal  "material_markup",                     :precision => 10, :scale => 2, :default => 1.2,        :null => false
    t.string   "indicator"
    t.datetime "scheduled_to_end_at"
    t.datetime "site_check_at"
    t.boolean  "site_check_potentially_work",                                        :default => false
  end

  add_index "jobs", ["bundle_with_job_id"], :name => "index_jobs_on_bundle_with_job_id"
  add_index "jobs", ["calculation_location_id"], :name => "index_jobs_on_calculation_location_id"
  add_index "jobs", ["contact_id"], :name => "index_jobs_on_contact_id"
  add_index "jobs", ["foundation_calculator_id"], :name => "index_jobs_on_foundation_calculator_id"
  add_index "jobs", ["foundation_id"], :name => "index_jobs_on_foundation_id"
  add_index "jobs", ["id"], :name => "index_jobs_on_id"
  add_index "jobs", ["job_type_id"], :name => "index_jobs_on_job_type_id"
  add_index "jobs", ["location_id"], :name => "index_jobs_on_location_id"
  add_index "jobs", ["pad_size_id"], :name => "index_jobs_on_pad_size_id"
  add_index "jobs", ["truck_id"], :name => "index_jobs_on_truck_id"

  create_table "library_files", :force => true do |t|
    t.integer  "job_id"
    t.string   "library_file"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "file_type"
    t.float    "file_size"
    t.string   "file_url"
  end

  add_index "library_files", ["job_id"], :name => "index_library_files_on_job_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_1"
    t.string   "city"
    t.string   "province"
    t.integer  "zip"
    t.string   "use_for_estimates",                               :default => "no"
    t.string   "lat"
    t.string   "lng"
    t.boolean  "on_map",                                          :default => true
    t.decimal  "multiplier",        :precision => 5, :scale => 1, :default => 1.0
  end

  create_table "material_quantity_labels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "material_uses", :force => true do |t|
    t.integer  "material_id",                                                     :null => false
    t.integer  "job_id",                                                          :null => false
    t.integer  "job_addition_id"
    t.decimal  "qty_estimated",   :precision => 10, :scale => 2, :default => 1.0, :null => false
    t.decimal  "qty_purchased",   :precision => 10, :scale => 2, :default => 1.0, :null => false
    t.decimal  "qty_used",        :precision => 10, :scale => 2, :default => 1.0, :null => false
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  add_index "material_uses", ["job_addition_id"], :name => "index_material_uses_on_job_addition_id"
  add_index "material_uses", ["job_id"], :name => "index_material_uses_on_job_id"
  add_index "material_uses", ["material_id"], :name => "index_material_uses_on_material_id"

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.string   "width",                                         :default => "1'"
    t.string   "length",                                        :default => "1'"
    t.string   "height",                                        :default => "1'"
    t.decimal  "qty_per_pack",   :precision => 10, :scale => 2, :default => 10.0
    t.decimal  "price_per_pack", :precision => 10, :scale => 2, :default => 0.0
    t.integer  "position",                                      :default => 100
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.string   "quantity_label"
    t.string   "category"
    t.boolean  "apply_markup",                                  :default => true
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
    t.boolean  "shows_on_todo_list",  :default => true
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

  create_table "payments", :force => true do |t|
    t.integer  "estimate_id"
    t.decimal  "amount",       :precision => 10, :scale => 2
    t.string   "reference"
    t.string   "method"
    t.integer  "user_id"
    t.datetime "deposited_at"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "quarries", :force => true do |t|
    t.string   "name"
    t.string   "lat"
    t.string   "lng"
    t.integer  "distance"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rigs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rock_pad_variables", :force => true do |t|
    t.string   "key"
    t.decimal  "value",       :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "shed_companies", :force => true do |t|
    t.string   "company"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "square_payments", :force => true do |t|
    t.string   "receipt_number"
    t.decimal  "total",          :precision => 10, :scale => 2, :default => 0.0
    t.integer  "estimate_id"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
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
    t.string   "row_highlight_color"
    t.string   "revenue_potential"
    t.integer  "percentage_probability"
    t.string   "projected_sale_amount"
    t.datetime "expected_close_date"
    t.string   "revenue_result"
    t.string   "current_situation"
  end

  add_index "statuses", ["contact_id"], :name => "index_statuses_on_contact_id"
  add_index "statuses", ["job_id"], :name => "index_statuses_on_job_id"
  add_index "statuses", ["next_action_id"], :name => "index_statuses_on_next_action_id"

  create_table "trucks", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crew_id"
  end

  add_index "trucks", ["crew_id"], :name => "index_trucks_on_crew_id"

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
    t.string   "permissions_levels"
    t.integer  "crew_id"
    t.text     "email_signature"
  end

  add_index "users", ["crew_id"], :name => "index_users_on_crew_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wepay_checkout_records", :force => true do |t|
    t.integer  "checkout_id"
    t.integer  "account_id"
    t.string   "state"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "currency"
    t.decimal  "amount",            :precision => 10, :scale => 2
    t.decimal  "app_fee",           :precision => 10, :scale => 2
    t.string   "fee_payer"
    t.decimal  "gross",             :precision => 10, :scale => 2
    t.decimal  "fee",               :precision => 10, :scale => 2
    t.string   "reference_id"
    t.text     "redirect_uri"
    t.text     "callback_uri"
    t.text     "checkout_uri"
    t.string   "payer_email"
    t.string   "payer_name"
    t.text     "cancel_reason"
    t.text     "refund_reason"
    t.boolean  "auto_capture"
    t.boolean  "require_shipping"
    t.text     "shipping_address"
    t.decimal  "tax",               :precision => 10, :scale => 2
    t.string   "security_token"
    t.string   "access_token"
    t.string   "mode"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "wepay_checkout_records", ["checkout_id"], :name => "index_wepay_checkout_records_on_checkout_id"

end
