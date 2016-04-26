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

ActiveRecord::Schema.define(version: 20160426135814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "residences", force: :cascade do |t|
    t.string   "title_of_page"
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
