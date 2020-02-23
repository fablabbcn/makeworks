# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_23_165451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "m_id"
    t.bigint "region_id", null: false
    t.string "country"
    t.string "address"
    t.string "background"
    t.string "file_types"
    t.string "intro"
    t.boolean "large_run"
    t.float "lat"
    t.float "lng"
    t.string "location"
    t.boolean "medium_run"
    t.string "minimum_order"
    t.string "name"
    t.string "number_of_staff"
    t.string "photo1"
    t.string "photo2"
    t.string "photo3"
    t.string "photo4"
    t.string "photo5"
    t.string "photo6"
    t.string "photo7"
    t.string "photo8"
    t.string "photo9"
    t.string "portrait"
    t.boolean "sample_production"
    t.boolean "short_run"
    t.boolean "soft_delete"
    t.string "top_image"
    t.string "video_link"
    t.string "website"
    t.string "year_founded"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_companies_on_region_id"
  end

  create_table "finished_products_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_finished_products_taxonomies_on_parent_id"
  end

  create_table "machines_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_machines_taxonomies_on_parent_id"
  end

  create_table "materials_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_materials_taxonomies_on_parent_id"
  end

  create_table "process_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_process_taxonomies_on_parent_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.boolean "can_signup"
    t.boolean "is_public"
    t.string "logo"
    t.string "trimmed_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "taxonomy"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_taxonomies_on_parent_id"
  end

  create_table "user_regions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_user_regions_on_region_id"
    t.index ["user_id"], name: "index_user_regions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "m_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "companies", "regions"
  add_foreign_key "user_regions", "regions"
  add_foreign_key "user_regions", "users"
end
