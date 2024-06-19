# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_19_162001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "suite"
    t.string "city"
    t.string "zipcode"
    t.bigint "geolocation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geolocation_id"], name: "index_addresses_on_geolocation_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "catch_phrase"
    t.string "bs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geolocations", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.bigint "address_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  add_foreign_key "addresses", "geolocations"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "companies"
end