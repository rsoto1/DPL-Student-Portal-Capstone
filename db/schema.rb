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

ActiveRecord::Schema.define(version: 20141013212050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.text     "text"
    t.string   "posted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pull_request_id"
  end

  add_index "answers", ["assignment_id"], name: "index_answers_on_assignment_id", using: :btree
  add_index "answers", ["pull_request_id"], name: "index_answers_on_pull_request_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "cohort_id"
    t.text     "description"
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", force: true do |t|
    t.boolean  "present"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cohorts", force: true do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "cohorts", ["course_id"], name: "index_cohorts_on_course_id", using: :btree
  add_index "cohorts", ["location_id"], name: "index_cohorts_on_location_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "duration"
    t.string   "duration_unit"
    t.decimal  "price",         precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "github_profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "image"
    t.string   "location"
    t.integer  "public_repo"
    t.integer  "public_gists"
    t.string   "member_since"
    t.string   "access_token"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "time_zone_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "names", force: true do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.boolean  "read"
    t.text     "message"
    t.string   "sender_name"
    t.string   "sender_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_managers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pull_requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.string   "repo"
    t.string   "title"
    t.integer  "pull_request_number"
    t.text     "body"
    t.string   "link"
    t.boolean  "mergeable"
    t.boolean  "merged"
    t.string   "sha"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_id"
  end

  add_index "pull_requests", ["answer_id"], name: "index_pull_requests_on_answer_id", using: :btree
  add_index "pull_requests", ["assignment_id"], name: "index_pull_requests_on_assignment_id", using: :btree
  add_index "pull_requests", ["user_id"], name: "index_pull_requests_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "github_username"
    t.string   "hometown"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cohort_id"
    t.string   "first_name"
    t.integer  "role",                   default: 0
    t.string   "last_name"
    t.string   "temp_password"
    t.string   "provider"
    t.string   "uid"
    t.string   "github_state"
    t.string   "github_access_token"
    t.string   "github_email"
  end

  add_index "users", ["cohort_id", "role"], name: "index_users_on_cohort_id_and_role", using: :btree
  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
