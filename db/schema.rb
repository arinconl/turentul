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

ActiveRecord::Schema.define(version: 20171215202203) do

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

  create_table "payments", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "last4"
    t.decimal  "amount"
    t.boolean  "success"
    t.string   "authorization_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "renters", force: :cascade do |t|
    t.string   "renterID"
    t.string   "provider"
    t.string   "renterName"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.string   "ticket"
    t.integer  "numRents"
    t.datetime "birthday"
    t.string   "email"
    t.string   "phone"
    t.boolean  "admin"
    t.string   "picture"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "ticket"
    t.string   "renterID"
    t.string   "renterName"
    t.string   "email"
    t.string   "bikeid"
    t.integer  "serialnumber"
    t.datetime "checkout"
    t.datetime "checkin"
    t.string   "location"
    t.float    "fare"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
