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

ActiveRecord::Schema.define(version: 2020_10_12_050251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_customers_on_name", unique: true
  end

  create_table "merchants", force: :cascade do |t|
    t.string "merchant_name", null: false
    t.string "merchant_address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_name", "merchant_address"], name: "index_merchants_on_merchant_name_and_merchant_address", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "description", null: false
    t.decimal "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description", "price"], name: "index_products_on_description_and_price", unique: true
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "quantity", null: false
    t.bigint "merchant_id", null: false
    t.bigint "product_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["merchant_id"], name: "index_sales_on_merchant_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "merchants"
  add_foreign_key "sales", "products"
end
