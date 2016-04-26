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

ActiveRecord::Schema.define(version: 20160426174649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "kitchen"
    t.boolean  "internet"
    t.boolean  "tv"
    t.boolean  "essentials"
    t.boolean  "shower_essentials"
    t.boolean  "heating"
    t.boolean  "airconditioning"
    t.boolean  "washer"
    t.boolean  "dryer"
    t.boolean  "dishwasher"
    t.boolean  "free_parking"
    t.boolean  "cable"
    t.boolean  "satellite"
    t.boolean  "breakfast"
    t.boolean  "pets"
    t.boolean  "kid_friendly"
    t.boolean  "events"
    t.boolean  "smoking"
    t.boolean  "wheelchair_accessible"
    t.boolean  "elevator"
    t.boolean  "fireplace"
    t.boolean  "intercom"
    t.boolean  "doorman"
    t.boolean  "pool"
    t.boolean  "hottub"
    t.boolean  "gym"
    t.boolean  "hangers"
    t.boolean  "iron"
    t.boolean  "hair_dryer"
    t.boolean  "workstation"
    t.boolean  "billiards"
    t.integer  "residence_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "owner"
    t.boolean  "renter"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "dob"
    t.string   "auth_token"
  end

end
