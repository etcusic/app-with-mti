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

ActiveRecord::Schema.define(version: 2020_11_07_164409) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "date_time"
    t.integer "tutor_id"
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_appointments_on_student_id"
    t.index ["tutor_id"], name: "index_appointments_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
  end

  create_table "tutors", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.text "resume"
    t.string "zoom_link"
    t.integer "rating"
    t.boolean "puppets"
    t.text "about_me"
    t.integer "level"
    t.integer "gold_stars"
    t.boolean "helicopter_parent"
    t.string "type"
    t.string "uid"
    t.string "image", default: "/photos/your_photo.jpeg"
  end

end
