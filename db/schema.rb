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

ActiveRecord::Schema.define(:version => 20130415140544) do

  create_table "answer_instances", :force => true do |t|
    t.integer  "original_answer_id"
    t.integer  "question_instance_id"
    t.text     "answer_text"
    t.integer  "point_value"
    t.boolean  "correct"
    t.integer  "position"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "question_id"
  end

  create_table "answers", :force => true do |t|
    t.text     "answer_text"
    t.integer  "point_value"
    t.boolean  "correct"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "question_id"
  end

  add_index "answers", ["id"], :name => "index_answers_on_id"
  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "arrival_ranges", :force => true do |t|
    t.string   "early"
    t.string   "late"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "banks", :force => true do |t|
    t.string   "bank_name"
    t.string   "author_note"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.date     "started_on"
    t.integer  "cost_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "candidate_batches", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "batch_file_name"
    t.string   "batch_content_type"
    t.integer  "batch_file_size"
    t.datetime "batch_updated_at"
  end

  create_table "candidates", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                                       :null => false
    t.string   "encrypted_password",                          :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",         :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "ym_id"
    t.text     "ym_custom_exam_fields"
    t.integer  "record_id"
    t.string   "username"
    t.string   "middle_name"
    t.string   "schedule_request_status", :default => "none"
  end

  add_index "candidates", ["email"], :name => "index_candidates_on_email", :unique => true
  add_index "candidates", ["reset_password_token"], :name => "index_candidates_on_reset_password_token", :unique => true

  create_table "contact_instances", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.text     "comment"
    t.integer  "candidate_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
=======
  create_table "check_payments", :force => true do |t|
    t.string   "check_number"
    t.decimal  "total",        :precision => 10, :scale => 2, :default => 0.0
    t.integer  "estimate_id"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
>>>>>>> 432b886201990f728e6c381b0230927eae1c1656
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

  create_table "content_blocks", :force => true do |t|
    t.string   "block_name"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "arrival_range_id"
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

  create_table "emails", :force => true do |t|
    t.string   "subject"
    t.string   "from"
    t.string   "bcc"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "internal_code"
  end

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
    t.boolean  "show_payment_buttons",    :default => true
    t.text     "additional_notes"
  end

  create_table "exam_assignments", :force => true do |t|
    t.integer  "candidate_id"
    t.integer  "exam_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "schedule_request_status", :default => "not yet"
    t.datetime "schedule_request_date"
    t.boolean  "available",               :default => true
  end

  create_table "exam_bank_assignments", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "bank_id"
    t.integer  "question_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "exam_instance_retakes", :force => true do |t|
    t.integer  "exam_instance_id"
    t.integer  "exam_assignment_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "exam_instances", :force => true do |t|
    t.integer  "exam_id"
    t.string   "exam_name"
    t.text     "keywords"
    t.datetime "availability_from"
    t.datetime "availability_to"
    t.text     "instructions"
    t.text     "author_notes"
    t.integer  "mastery_score"
    t.text     "pass_message"
    t.text     "fail_message"
    t.integer  "time_allowed_in_minutes"
    t.boolean  "track_time"
    t.boolean  "review_answers_page"
    t.text     "pre_honor_code"
    t.text     "post_honor_code"
    t.integer  "questions_per_page"
    t.boolean  "shuffle_questions"
    t.boolean  "shuffle_answers"
    t.boolean  "published"
    t.datetime "published_date"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "candidate_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "exam_type",               :default => "practice"
    t.integer  "final_score"
    t.string   "exam_mode"
    t.string   "ym_custom_field_name"
    t.string   "ym_custom_field_label"
    t.string   "password_used"
  end

  create_table "exam_passwords", :force => true do |t|
    t.string   "password"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exams", :force => true do |t|
    t.string   "exam_name"
    t.text     "keywords"
    t.datetime "availability_from"
    t.datetime "availability_to"
    t.text     "instructions"
    t.text     "author_notes"
    t.integer  "mastery_score"
    t.text     "pass_message"
    t.text     "fail_message"
    t.integer  "time_allowed_in_minutes"
    t.boolean  "track_time"
    t.boolean  "review_answers_page"
    t.text     "pre_honor_code"
    t.text     "post_honor_code"
    t.integer  "questions_per_page"
    t.boolean  "shuffle_questions"
    t.boolean  "shuffle_answers"
    t.boolean  "published"
    t.datetime "published_date"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "exam_type",               :default => "practice"
    t.string   "ym_custom_field_name"
    t.string   "ym_custom_field_label"
  end

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
  end

  add_index "jobs", ["id"], :name => "index_jobs_on_id"

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
    t.string   "use_for_estimates", :default => "no"
    t.string   "lat"
    t.string   "lng"
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

  create_table "question_assignments", :force => true do |t|
    t.integer  "question_id"
    t.integer  "exam_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "question_banks", :force => true do |t|
    t.integer  "question_id"
    t.integer  "bank_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "question_instances", :force => true do |t|
    t.integer  "original_question_id"
    t.integer  "exam_instance_id"
    t.string   "question_name"
    t.string   "external_id"
    t.text     "keywords"
    t.text     "question_text"
    t.text     "question_hint"
    t.text     "author_note"
    t.text     "question_feedback"
    t.datetime "created_at",                                                                  :null => false
    t.datetime "updated_at",                                                                  :null => false
    t.string   "question_status"
    t.string   "question_type"
    t.boolean  "flagged_for_review",                                       :default => false
    t.integer  "chosen_answer_instance_id"
    t.integer  "position"
    t.decimal  "diff",                      :precision => 10, :scale => 0
  end

  create_table "question_taxonomies", :force => true do |t|
    t.integer  "taxonomy_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "question_name"
    t.string   "external_id"
    t.text     "keywords"
    t.text     "question_text"
    t.text     "question_hint"
    t.text     "author_note"
    t.text     "question_feedback"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "question_status",   :default => "written"
    t.string   "question_type"
    t.float    "diff"
  end

  create_table "rock_pad_variables", :force => true do |t|
    t.string   "key"
    t.decimal  "value",       :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "schedule_requests", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.string   "country"
    t.string   "organization"
    t.string   "proctor_type"
    t.string   "proctor_name"
    t.string   "proctor_email"
    t.integer  "exam_id"
    t.datetime "exam_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "candidate_id"
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

  create_table "taxonomies", :force => true do |t|
    t.string   "taxon_name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.string   "permissions_levels"
    t.integer  "crew_id"
    t.text     "email_signature"
  end

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
