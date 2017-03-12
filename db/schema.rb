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

ActiveRecord::Schema.define(version: 20170310083729) do

  create_table "assigns", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "project_id"
    t.integer  "system_id"
    t.integer  "user_id"
    t.integer  "month_id"
    t.decimal  "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_assigns_on_group_id"
    t.index ["month_id"], name: "index_assigns_on_month_id"
    t.index ["project_id"], name: "index_assigns_on_project_id"
    t.index ["system_id"], name: "index_assigns_on_system_id"
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "costs", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "project_id"
    t.integer  "system_id"
    t.integer  "rank_id"
    t.integer  "month_id"
    t.decimal  "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_costs_on_group_id"
    t.index ["month_id"], name: "index_costs_on_month_id"
    t.index ["project_id"], name: "index_costs_on_project_id"
    t.index ["rank_id"], name: "index_costs_on_rank_id"
    t.index ["system_id"], name: "index_costs_on_system_id"
  end

  create_table "depts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "dept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dept_id"], name: "index_groups_on_dept_id"
  end

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "group_id"
    t.integer  "system_id"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_orders_on_group_id"
    t.index ["project_id"], name: "index_orders_on_project_id"
    t.index ["system_id"], name: "index_orders_on_system_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "number"
    t.string   "name"
    t.date     "end_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "name"
    t.integer  "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "number"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "number"
    t.string   "name"
    t.integer  "rank_id"
    t.date     "end_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rank_id"], name: "index_users_on_rank_id"
  end

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "month_id"
    t.decimal  "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_works_on_month_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

end
