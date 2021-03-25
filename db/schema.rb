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

ActiveRecord::Schema.define(version: 2021_03_25_180827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alliances", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slogan"
    t.string "description"
  end

  create_table "business_alliances", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.bigint "alliance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alliance_id"], name: "index_business_alliances_on_alliance_id"
    t.index ["business_id"], name: "index_business_alliances_on_business_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.string "website_url"
    t.string "phone_number"
    t.string "logo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password_digest"
    t.bigint "user_id"
    t.string "category"
    t.bigint "alliance_id"
    t.index ["alliance_id"], name: "index_businesses_on_alliance_id"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "perks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "alliance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alliance_id"], name: "index_perks_on_alliance_id"
  end

  create_table "user_alliances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "alliance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alliance_id"], name: "index_user_alliances_on_alliance_id"
    t.index ["user_id"], name: "index_user_alliances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "business_alliances", "alliances"
  add_foreign_key "business_alliances", "businesses"
  add_foreign_key "perks", "alliances"
  add_foreign_key "user_alliances", "alliances"
  add_foreign_key "user_alliances", "users"
end
