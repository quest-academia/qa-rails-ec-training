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

ActiveRecord::Schema.define(version: 2020_12_11_170656) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "product_status_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "product_name", null: false
    t.integer "price", null: false
    t.string "description"
    t.boolean "delete_flag", null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "sale_status_id", null: false
    t.bigint "product_status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["product_status_id"], name: "index_products_on_product_status_id"
    t.index ["sale_status_id"], name: "index_products_on_sale_status_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "purchase_price", null: false
    t.integer "purchase_quanity", null: false
    t.string "purchase_company", null: false
    t.datetime "order_date"
    t.datetime "purchase_date"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  create_table "sale_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "sale_status_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_classifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_classification_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "password"
    t.string "last_name"
    t.string "first_name"
    t.integer "zipcode"
    t.string "prefecture"
    t.string "municipality"
    t.string "address"
    t.string "apartments"
    t.string "email"
    t.string "phone_number"
    t.bigint "user_classification_id", null: false
    t.string "company_name"
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_classification_id"], name: "index_users_on_user_classification_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "product_statuses"
  add_foreign_key "products", "sale_statuses"
  add_foreign_key "products", "users"
  add_foreign_key "purchases", "products"
  add_foreign_key "users", "user_classifications"
end
