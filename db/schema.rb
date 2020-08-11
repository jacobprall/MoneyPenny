# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_11_023037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "label", null: false
    t.string "user_id", null: false
    t.decimal "balance", precision: 8, scale: 2, null: false
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inst"
    t.string "balance_sheet", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "bills", force: :cascade do |t|
    t.string "name", null: false
    t.string "details"
    t.decimal "amount_due", precision: 8, scale: 2, null: false
    t.integer "recurring", null: false
    t.datetime "due_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid", default: false, null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "goal_category", null: false
    t.string "title", null: false
    t.string "notes"
    t.integer "goal_amt", null: false
    t.integer "account_id", null: false
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "target_date"
    t.index ["account_id"], name: "index_goals_on_account_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "account_id", null: false
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.text "notes"
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "category"
    t.string "tags"
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fname", null: false
    t.string "lname", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
