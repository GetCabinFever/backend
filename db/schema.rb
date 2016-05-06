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

ActiveRecord::Schema.define(version: 20160506135920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.integer "residence_id"
    t.boolean "kitchen"
    t.boolean "internet"
    t.boolean "tv"
    t.boolean "essentials"
    t.boolean "shower_essentials"
    t.boolean "heating"
    t.boolean "airconditioning"
    t.boolean "washer"
    t.boolean "dryer"
    t.boolean "dishwasher"
    t.boolean "free_parking"
    t.boolean "cable"
    t.boolean "satellite"
    t.boolean "breakfast"
    t.boolean "pets"
    t.boolean "kid_friendly"
    t.boolean "events"
    t.boolean "smoking"
    t.boolean "wheelchair_accessible"
    t.boolean "elevator"
    t.boolean "fireplace"
    t.boolean "intercom"
    t.boolean "doorman"
    t.boolean "pool"
    t.boolean "hottub"
    t.boolean "gym"
    t.boolean "hangers"
    t.boolean "iron"
    t.boolean "hair_dryer"
    t.boolean "workstation"
    t.boolean "billiards"
  end

  create_table "guest_books", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "residence_id"
    t.text     "entry"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "residences", force: :cascade do |t|
    t.string   "title_of_page"
    t.integer  "user_id"
    t.string   "booking_url"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "property_type"
    t.string   "contact_host_email"
    t.integer  "accommodates"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "beds"
    t.integer  "base_price"
    t.text     "description_of_listing"
    t.text     "house_rules"
    t.text     "the_space"
    t.text     "guest_access"
    t.text     "interaction_with_guests"
    t.text     "the_area"
    t.text     "other_things_to_note"
    t.date     "check_in"
    t.date     "check_out"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "safeties", force: :cascade do |t|
    t.integer  "residence_id"
    t.boolean  "smoke",        default: false
    t.boolean  "co2",          default: false
    t.boolean  "first_aid",    default: false
    t.boolean  "safety_card",  default: false
    t.boolean  "extinguisher", default: false
    t.boolean  "fire_alarm",   default: false
    t.boolean  "gas_shutoff",  default: false
    t.boolean  "generator",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "email"
    t.boolean  "owner"
    t.boolean  "renter"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "dob"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
