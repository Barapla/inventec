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

ActiveRecord::Schema[7.0].define(version: 2024_11_04_144746) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.string "name"
    t.text "description"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["uuid"], name: "index_categories_on_uuid", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.string "first_name"
    t.string "last_name"
    t.string "employee_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_employees_on_uuid", unique: true
  end

  create_table "institution_items", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.bigint "item_id", null: false
    t.bigint "institution_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_institution_items_on_institution_id"
    t.index ["item_id"], name: "index_institution_items_on_item_id"
    t.index ["uuid"], name: "index_institution_items_on_uuid", unique: true
  end

  create_table "institutions", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_institutions_on_uuid", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.string "name"
    t.text "description"
    t.integer "item_type"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["uuid"], name: "index_items_on_uuid", unique: true
  end

  create_table "movements", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.bigint "institution_item_id", null: false
    t.bigint "user_id", null: false
    t.integer "movement_type"
    t.integer "status"
    t.integer "amount"
    t.bigint "employee_id"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_movements_on_employee_id"
    t.index ["institution_id"], name: "index_movements_on_institution_id"
    t.index ["institution_item_id"], name: "index_movements_on_institution_item_id"
    t.index ["user_id"], name: "index_movements_on_user_id"
    t.index ["uuid"], name: "index_movements_on_uuid", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "active", default: true
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "institution_items", "institutions"
  add_foreign_key "institution_items", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "movements", "employees"
  add_foreign_key "movements", "institution_items"
  add_foreign_key "movements", "institutions"
  add_foreign_key "movements", "users"
end
