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

ActiveRecord::Schema.define(version: 2020_09_01_232006) do

  create_table "gardeners", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.string "variety"
    t.integer "gardener_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gardener_id"], name: "index_gardens_on_gardener_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "amount_of_sun"
    t.string "water_frequency"
    t.string "category"
    t.integer "garden_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garden_id"], name: "index_plants_on_garden_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.integer "garden_id", null: false
    t.index ["garden_id"], name: "index_tasks_on_garden_id"
  end

  add_foreign_key "gardens", "gardeners"
  add_foreign_key "plants", "gardens"
  add_foreign_key "tasks", "gardens"
end
