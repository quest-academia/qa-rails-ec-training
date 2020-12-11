ActiveRecord::Schema.define(version: 2020_12_10_072854) do

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

  add_foreign_key "users", "user_classifications"
end
