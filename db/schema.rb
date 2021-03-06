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

ActiveRecord::Schema.define(version: 20160605011241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "stay_at_home",    default: false
    t.boolean  "day_tripper",     default: false
    t.boolean  "explorer",        default: false
    t.boolean  "itinerant",       default: false
    t.boolean  "frequent_flyer",  default: false
    t.boolean  "world_nomad",     default: false
    t.boolean  "bird_of_passage", default: false
    t.boolean  "travel_hero",     default: false
    t.boolean  "nature_lover",    default: false
    t.boolean  "eskimo",          default: false
    t.boolean  "leprechaun",      default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "badges", ["user_id"], name: "index_badges_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["user_id"], name: "index_countries_on_user_id", using: :btree

  create_table "country_infos", force: :cascade do |t|
    t.string   "name"
    t.string   "countrycode"
    t.string   "capital"
    t.string   "region"
    t.integer  "population"
    t.integer  "area"
    t.string   "callingcode"
    t.string   "demonym"
    t.string   "currency"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "visited_countries", default: 0
    t.boolean  "public_profile",    default: true
    t.integer  "badges_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
