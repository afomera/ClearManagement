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

ActiveRecord::Schema.define(version: 20160508221010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "service_request_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "activities", ["service_request_id"], name: "index_activities_on_service_request_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "technician_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "conversations", ["technician_id"], name: "index_conversations_on_technician_id", using: :btree
  add_index "conversations", ["user_id"], name: "index_conversations_on_user_id", using: :btree

  create_table "inventory_reports", force: :cascade do |t|
    t.string   "technician_name"
    t.integer  "dish_count"
    t.integer  "cannister_count"
    t.integer  "modem_count"
    t.integer  "radio_count"
    t.integer  "voip_count"
    t.integer  "trimast_count"
    t.integer  "upgradearm_count"
    t.integer  "raven_upgrade_kit_count"
    t.text     "notes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.string   "status"
    t.string   "direction"
    t.string   "sid"
    t.string   "messaging_service_sid"
    t.string   "from"
    t.string   "to"
    t.integer  "conversation_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  create_table "service_requests", force: :cascade do |t|
    t.string   "customer_name"
    t.string   "customer_phone"
    t.string   "customer_email"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "apartment"
    t.string   "state"
  end

  create_table "technicians", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
  end

  add_index "technicians", ["user_id"], name: "index_technicians_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "service_requests"
  add_foreign_key "activities", "users"
  add_foreign_key "conversations", "technicians"
  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "technicians", "users"
end
