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

ActiveRecord::Schema.define(version: 20170320082838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigns", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "user_id"
    t.integer "month_id"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_assigns_on_month_id"
    t.index ["order_id"], name: "index_assigns_on_order_id"
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "costs", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "rank_id"
    t.integer "month_id"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_costs_on_month_id"
    t.index ["order_id"], name: "index_costs_on_order_id"
    t.index ["rank_id"], name: "index_costs_on_rank_id"
  end

  create_table "depts", id: :serial, force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.integer "dept_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dept_id"], name: "index_groups_on_dept_id"
  end

  create_table "months", id: :serial, force: :cascade do |t|
    t.integer "year_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_months_on_year_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "group_id"
    t.integer "system_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_orders_on_group_id"
    t.index ["project_id"], name: "index_orders_on_project_id"
    t.index ["system_id"], name: "index_orders_on_system_id"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", id: :serial, force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.integer "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "month_id"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_schedules_on_month_id"
    t.index ["project_id"], name: "index_schedules_on_project_id"
    t.index ["step_id"], name: "index_schedules_on_step_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", id: :serial, force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.integer "rank_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["rank_id"], name: "index_users_on_rank_id"
  end

  create_table "works", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "month_id"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_works_on_month_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  create_table "years", force: :cascade do |t|
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assigns", "months"
  add_foreign_key "assigns", "orders"
  add_foreign_key "assigns", "users"
  add_foreign_key "costs", "months"
  add_foreign_key "costs", "orders"
  add_foreign_key "costs", "ranks"
  add_foreign_key "groups", "depts"
  add_foreign_key "months", "years"
  add_foreign_key "orders", "groups"
  add_foreign_key "orders", "projects"
  add_foreign_key "orders", "systems"
  add_foreign_key "schedules", "months"
  add_foreign_key "schedules", "projects"
  add_foreign_key "schedules", "steps"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "ranks"
  add_foreign_key "works", "months"
  add_foreign_key "works", "users"
end
