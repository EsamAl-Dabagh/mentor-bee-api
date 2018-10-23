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

ActiveRecord::Schema.define(version: 2018_10_22_142515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentees", force: :cascade do |t|
    t.bigint "user_id"
    t.string "bio"
    t.string "interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mentees_on_user_id", unique: true
  end

  create_table "mentors", force: :cascade do |t|
    t.bigint "user_id"
    t.string "bio"
    t.string "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mentors_on_user_id", unique: true
  end

  create_table "mentorships", force: :cascade do |t|
    t.bigint "mentor_id"
    t.bigint "mentee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_mentorships_on_mentee_id"
    t.index ["mentor_id", "mentee_id"], name: "index_mentorships_on_mentor_id_and_mentee_id", unique: true
    t.index ["mentor_id"], name: "index_mentorships_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "pic", default: "https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "mentees", "users"
  add_foreign_key "mentors", "users"
  add_foreign_key "mentorships", "mentees"
  add_foreign_key "mentorships", "mentors"
end
