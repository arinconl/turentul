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

ActiveRecord::Schema.define(version: 20171101004858) do

  create_table "bikes", force: :cascade do |t|
    t.string   "bikeid"
    t.integer  "serialnumber"
    t.string   "rating"
    t.string   "condition"
    t.datetime "maintenance"
    t.string   "style"
    t.string   "size"
    t.string   "color"
    t.boolean  "availability"
    t.datetime "lastcheck"
    t.string   "location"
    t.float    "fare"
    t.string   "accessories"
    t.string   "picture"
  end

  create_table "renters", force: :cascade do |t|
    t.integer  "renterID"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "cCN"
    t.string   "ticket"
    t.integer  "numRents"
    t.datetime "birthday"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "renters", ["email"], name: "index_renters_on_email", unique: true
  add_index "renters", ["reset_password_token"], name: "index_renters_on_reset_password_token", unique: true

end
