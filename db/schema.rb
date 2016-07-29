# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160728125911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "monday_breakfast_meal_id"
    t.integer  "monday_lunch_meal_id"
    t.integer  "monday_dinner_meal_id"
    t.integer  "tuesday_breakfast_meal_id"
    t.integer  "tuesday_lunch_meal_id"
    t.integer  "tuesday_dinner_meal_id"
    t.integer  "wednesday_breakfast_meal_id"
    t.integer  "wednesday_lunch_meal_id"
    t.integer  "wednesday_dinner_meal_id"
    t.integer  "thursday_breakfast_meal_id"
    t.integer  "thursday_lunch_meal_id"
    t.integer  "thursday_dinner_meal_id"
    t.integer  "friday_breakfast_meal_id"
    t.integer  "friday_lunch_meal_id"
    t.integer  "friday_dinner_meal_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "meal_reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "calories"
    t.integer  "protein"
    t.integer  "fat"
    t.integer  "carbohydrates"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meal_plan_id"
    t.integer  "meal_id"
    t.integer  "status",       default: 0
    t.string   "token"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pricing_plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "stripe_name"
    t.string   "state",       default: "active"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "pricing_plan_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "active_meal_plan_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
