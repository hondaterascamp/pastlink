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

ActiveRecord::Schema[8.0].define(version: 2026_11_09_054654) do
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

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "machines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "code"
    t.integer "department_id", null: false
    t.integer "product_id", null: false
    t.index ["department_id"], name: "index_machines_on_department_id"
    t.index ["product_id"], name: "index_machines_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "code"
    t.integer "department_id", null: false
    t.index ["department_id"], name: "index_products_on_department_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "troubles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "machine_id", null: false
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.datetime "stopped_at"
    t.integer "downtime"
    t.integer "status", default: 0, null: false
    t.text "cause"
    t.text "action"
    t.index ["machine_id"], name: "index_troubles_on_machine_id"
    t.index ["product_id"], name: "index_troubles_on_product_id"
    t.index ["user_id"], name: "index_troubles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "employee_number", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "department_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["employee_number"], name: "index_users_on_employee_number", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "machines", "departments"
  add_foreign_key "machines", "products"
  add_foreign_key "products", "departments"
  add_foreign_key "sessions", "users"
  add_foreign_key "troubles", "machines"
  add_foreign_key "troubles", "products"
  add_foreign_key "troubles", "users"
  add_foreign_key "users", "departments"
end
