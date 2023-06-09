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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_123131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
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

  create_table "addresses", force: :cascade do |t|
    t.text "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id", null: false
    t.text "line1"
    t.text "line2"
    t.index ["order_id"], name: "index_addresses_on_order_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id", null: false
    t.bigint "seller_id", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["seller_id"], name: "index_answers_on_seller_id"
  end

  create_table "base_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "main_category_id"
    t.integer "type"
    t.index ["main_category_id"], name: "index_base_categories_on_main_category_id"
  end

  create_table "campaign_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id", null: false
    t.bigint "product_id", null: false
    t.index ["campaign_id"], name: "index_campaign_items_on_campaign_id"
    t.index ["product_id"], name: "index_campaign_items_on_product_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "discount"
    t.text "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_order_items_on_campaign_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total_price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "color"
    t.text "description"
    t.integer "quantity"
    t.decimal "price"
    t.integer "review_count"
    t.decimal "average_rate", precision: 3, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_id", null: false
    t.bigint "category_id", null: false
    t.string "name"
    t.string "company"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "products_on_name_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.index ["customer_id"], name: "index_questions_on_customer_id"
    t.index ["product_id"], name: "index_questions_on_product_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "orders"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users", column: "seller_id"
  add_foreign_key "base_categories", "base_categories", column: "main_category_id"
  add_foreign_key "campaign_items", "campaigns"
  add_foreign_key "campaign_items", "products"
  add_foreign_key "order_items", "campaigns"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users", column: "customer_id"
  add_foreign_key "products", "base_categories", column: "category_id"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "questions", "products"
  add_foreign_key "questions", "users", column: "customer_id"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users", column: "customer_id"
end
