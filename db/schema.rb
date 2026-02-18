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

ActiveRecord::Schema[8.1].define(version: 2026_02_18_220050) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "employees", force: :cascade do |t|
    t.decimal "base_salary", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.integer "employment_type", default: 0, null: false
    t.date "hire_date"
    t.decimal "hourly_rate", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["employment_type"], name: "index_employees_on_employment_type"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "payroll_adjustments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.string "description", null: false
    t.integer "kind", null: false
    t.bigint "payroll_id", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_payroll_adjustments_on_kind"
    t.index ["payroll_id"], name: "index_payroll_adjustments_on_payroll_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.decimal "base_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.decimal "discount_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "employee_id", null: false
    t.decimal "extra_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.boolean "locked", default: false, null: false
    t.date "reference_month", null: false
    t.decimal "total_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id", "reference_month"], name: "index_payrolls_on_employee_id_and_reference_month", unique: true
    t.index ["employee_id"], name: "index_payrolls_on_employee_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "time_punches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "employee_id", null: false
    t.integer "kind", null: false
    t.datetime "punched_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id", "punched_at"], name: "index_time_punches_on_employee_id_and_punched_at"
    t.index ["employee_id"], name: "index_time_punches_on_employee_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "employees", "users"
  add_foreign_key "payroll_adjustments", "payrolls"
  add_foreign_key "payrolls", "employees"
  add_foreign_key "sessions", "users"
  add_foreign_key "time_punches", "employees"
end
