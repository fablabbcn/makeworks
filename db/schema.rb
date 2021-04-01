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

ActiveRecord::Schema.define(version: 2021_03_31_183410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blog_categories", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "m_id"
    t.string "blurb"
    t.bigint "blog_category_id"
    t.text "content"
    t.boolean "dont_publish"
    t.string "featured_video"
    t.string "header_image"
    t.bigint "medium_id"
    t.string "slug"
    t.string "sub_title"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_category_id"], name: "index_blogs_on_blog_category_id"
    t.index ["medium_id"], name: "index_blogs_on_medium_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "m_id"
    t.bigint "region_id", null: false
    t.string "name"
    t.string "address"
    t.text "background"
    t.text "description"
    t.text "intro"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "contact_jobtitle"
    t.string "flickr"
    t.string "facebook"
    t.string "instagram"
    t.boolean "large_run"
    t.float "lat"
    t.float "lng"
    t.string "linkedin"
    t.string "location"
    t.boolean "medium_run"
    t.string "minimum_order"
    t.integer "number_of_staff"
    t.string "file_types"
    t.string "image_bucket"
    t.string "photo1"
    t.string "photo2"
    t.string "photo3"
    t.string "photo4"
    t.string "photo5"
    t.string "photo6"
    t.string "photo7"
    t.string "photo8"
    t.string "photo9"
    t.string "pinterest"
    t.string "portrait"
    t.boolean "sample_production"
    t.boolean "short_run"
    t.boolean "soft_delete"
    t.string "title"
    t.string "top_image"
    t.string "trimmed_name"
    t.string "turnaround_time"
    t.string "twitter"
    t.string "video_link"
    t.string "website"
    t.string "youtube"
    t.integer "year_founded"
    t.boolean "film_ready"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "been_visited"
    t.boolean "bespoke_one_offs"
    t.boolean "works_with_general_public"
    t.boolean "works_with_large_business"
    t.boolean "works_with_professionals"
    t.boolean "works_with_small_companies"
    t.boolean "works_with_students"
    t.boolean "batch_production"
    t.string "production_access"
    t.boolean "is_verified"
    t.text "production_specifics"
    t.bigint "user_id"
    t.index ["region_id"], name: "index_companies_on_region_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_processes", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "process_taxonomy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_processes_on_company_id"
    t.index ["process_taxonomy_id"], name: "index_company_processes_on_process_taxonomy_id"
  end

  create_table "finished_products", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "finished_products_taxonomy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_finished_products_on_company_id"
    t.index ["finished_products_taxonomy_id"], name: "index_finished_products_on_finished_products_taxonomy_id"
  end

  create_table "finished_products_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_finished_products_taxonomies_on_parent_id"
  end

  create_table "industries", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "industry_taxonomy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_industries_on_company_id"
    t.index ["industry_taxonomy_id"], name: "index_industries_on_industry_taxonomy_id"
  end

  create_table "industry_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_industry_taxonomies_on_parent_id"
  end

  create_table "machines", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "machines_taxonomy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_machines_on_company_id"
    t.index ["machines_taxonomy_id"], name: "index_machines_on_machines_taxonomy_id"
  end

  create_table "machines_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["parent_id"], name: "index_machines_taxonomies_on_parent_id"
    t.index ["slug"], name: "index_machines_taxonomies_on_slug", unique: true
  end

  create_table "manufacturer_taxonomies", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_manufacturer_taxonomies_on_parent_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "manufacturer_taxonomy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_manufacturers_on_company_id"
    t.index ["manufacturer_taxonomy_id"], name: "index_manufacturers_on_manufacturer_taxonomy_id"
  end

  create_table "material_tags", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_material_tags_on_company_id"
    t.index ["material_id"], name: "index_material_tags_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "m_id"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_materials_on_parent_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "m_id"
    t.bigint "company_id"
    t.string "thumbnail_url"
    t.string "web_url"
    t.string "hi_res"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_media_on_company_id"
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
    t.float "lat"
    t.float "lng"
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
    t.boolean "is_champion"
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
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.string "slug"
    t.string "locale"
    t.string "time_zone", default: "UTC"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "blog_categories"
  add_foreign_key "blogs", "media"
  add_foreign_key "companies", "regions"
  add_foreign_key "companies", "users"
  add_foreign_key "company_processes", "companies"
  add_foreign_key "company_processes", "process_taxonomies"
  add_foreign_key "finished_products", "companies"
  add_foreign_key "finished_products", "finished_products_taxonomies"
  add_foreign_key "industries", "companies"
  add_foreign_key "industries", "industry_taxonomies"
  add_foreign_key "machines", "companies"
  add_foreign_key "machines", "machines_taxonomies"
  add_foreign_key "manufacturers", "companies"
  add_foreign_key "manufacturers", "manufacturer_taxonomies"
  add_foreign_key "material_tags", "companies"
  add_foreign_key "material_tags", "materials"
  add_foreign_key "user_regions", "regions"
  add_foreign_key "user_regions", "users"
end
