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

ActiveRecord::Schema.define(version: 20170305031958) do

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_sections", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_student_sections_on_section_id"
    t.index ["student_id"], name: "index_student_sections_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "emerg_contact_name",  limit: 255
    t.string   "emerg_contact_phone", limit: 255
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: :cascade do |t|
    t.string  "first_name", limit: 255
    t.string  "last_name",  limit: 255
    t.integer "user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "section_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "cost"
    t.string   "location",         limit: 255
    t.string   "foursquare_locid", limit: 255
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "public_id",        limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
