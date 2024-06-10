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

ActiveRecord::Schema[7.1].define(version: 2024_06_09_013622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discount_campaigns", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "discount_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_discount_campaigns_on_product_id"
  end

  create_table "discount_histories", force: :cascade do |t|
    t.bigint "discount_campaign_id", null: false
    t.datetime "change_date"
    t.string "user"
    t.decimal "old_discount_price"
    t.decimal "new_discount_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_campaign_id"], name: "index_discount_histories_on_discount_campaign_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "discount_type"
    t.decimal "discount_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_discounts_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "discount_campaigns", "products"
  add_foreign_key "discount_histories", "discount_campaigns"
  add_foreign_key "discounts", "products"
end
