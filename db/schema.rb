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

ActiveRecord::Schema[7.0].define(version: 2022_07_18_101936) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "location_type", null: false
    t.text "description"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id", null: false
    t.bigint "source_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_routes_on_destination_id"
    t.index ["region_id"], name: "index_routes_on_region_id"
    t.index ["source_id"], name: "index_routes_on_source_id"
  end

  create_table "transport_bids", force: :cascade do |t|
    t.string "reference_no", null: false
    t.text "description"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.date "opening_date", null: false
    t.string "status", null: false
    t.integer "bid_bond_amount", null: false
    t.bigint "transport_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_plan_id"], name: "index_transport_bids_on_transport_plan_id"
  end

  create_table "transport_offers", force: :cascade do |t|
    t.bigint "transport_bid_id", null: false
    t.bigint "transporter_id", null: false
    t.date "offer_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_bid_id"], name: "index_transport_offers_on_transport_bid_id"
    t.index ["transporter_id"], name: "index_transport_offers_on_transporter_id"
  end

  create_table "transport_plan_items", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "transport_plan_id", null: false
    t.integer "quantity", null: false
    t.bigint "unit_id", null: false
    t.boolean "planned", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_transport_plan_items_on_route_id"
    t.index ["transport_plan_id"], name: "index_transport_plan_items_on_transport_plan_id"
    t.index ["unit_id"], name: "index_transport_plan_items_on_unit_id"
  end

  create_table "transport_plans", force: :cascade do |t|
    t.string "reference_no", null: false
    t.string "plan_type", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_transport_plans_on_region_id"
  end

  create_table "transporters", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "contact_phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_of_measures", force: :cascade do |t|
    t.string "name", null: false
    t.string "abreviation", null: false
    t.string "unit_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "routes", "locations", column: "destination_id"
  add_foreign_key "routes", "locations", column: "region_id"
  add_foreign_key "routes", "locations", column: "source_id"
  add_foreign_key "transport_bids", "transport_plans"
  add_foreign_key "transport_offers", "transport_bids"
  add_foreign_key "transport_offers", "transporters"
  add_foreign_key "transport_plan_items", "routes"
  add_foreign_key "transport_plan_items", "transport_plans"
  add_foreign_key "transport_plan_items", "unit_of_measures", column: "unit_id"
  add_foreign_key "transport_plans", "locations", column: "region_id"
end
