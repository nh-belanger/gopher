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

ActiveRecord::Schema.define(version: 20170208012717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dinings", force: :cascade do |t|
    t.integer "member_id"
    t.integer "reservation_id"
    t.index ["member_id"], name: "index_dinings_on_member_id", using: :btree
    t.index ["reservation_id"], name: "index_dinings_on_reservation_id", using: :btree
  end

  create_table "holes", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "par",    null: false
    t.integer "length", null: false
    t.integer "score"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.integer  "member_number",                             null: false
    t.string   "role",                   default: "member", null: false
    t.string   "access_token"
    t.string   "refresh_token"
    t.index ["email"], name: "index_members_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.time    "time",       null: false
    t.date    "date",       null: false
    t.string  "room",       null: false
    t.integer "party_size", null: false
  end

  create_table "scorecards", force: :cascade do |t|
    t.integer "course_par",    null: false
    t.integer "course_length", null: false
    t.integer "total_score"
  end

  create_table "teetimes", force: :cascade do |t|
    t.time    "time",          null: false
    t.date    "date",          null: false
    t.integer "starting_hole", null: false
    t.string  "creator"
    t.string  "formatteddate"
    t.string  "formattedtime"
  end

  create_table "timesheets", force: :cascade do |t|
    t.integer "member_id"
    t.integer "teetime_id"
    t.index ["member_id"], name: "index_timesheets_on_member_id", using: :btree
    t.index ["teetime_id"], name: "index_timesheets_on_teetime_id", using: :btree
  end

end
