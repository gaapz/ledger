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

ActiveRecord::Schema.define(version: 2023_01_23_091038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accont_lock_versions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "version"
    t.uuid "ledger_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "posted_balance", default: 0
    t.bigint "pending_balance", default: 0
    t.bigint "available_balance", default: 0
    t.index ["ledger_account_id"], name: "index_accont_lock_versions_on_ledger_account_id"
  end

  create_table "ledger_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.json "metadata"
    t.string "normal_balance"
    t.string "currency"
    t.integer "currency_exponent"
    t.uuid "ledger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_id"], name: "index_ledger_accounts_on_ledger_id"
  end

  create_table "ledger_entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "amount"
    t.string "direction"
    t.uuid "ledger_transaction_id", null: false
    t.uuid "ledger_account_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_account_id"], name: "index_ledger_entries_on_ledger_account_id"
    t.index ["ledger_transaction_id"], name: "index_ledger_entries_on_ledger_transaction_id"
  end

  create_table "ledger_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description"
    t.string "status"
    t.string "external_id"
    t.datetime "effective_at"
    t.datetime "posted_at"
    t.json "metadata"
    t.uuid "ledger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_id"], name: "index_ledger_transactions_on_ledger_id"
  end

  create_table "ledgers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.json "metadata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accont_lock_versions", "ledger_accounts"
  add_foreign_key "ledger_accounts", "ledgers"
  add_foreign_key "ledger_entries", "ledger_accounts"
  add_foreign_key "ledger_entries", "ledger_transactions"
  add_foreign_key "ledger_transactions", "ledgers"
end
