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

ActiveRecord::Schema.define(version: 20160811204900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "english_grades", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.string   "title"
    t.string   "subcategory"
    t.string   "performance_grade"
    t.text     "feedback"
    t.datetime "grade_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["student_id"], name: "index_english_grades_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_english_grades_on_teacher_id", using: :btree
  end

  create_table "generated_feedbacks", force: :cascade do |t|
    t.string   "performance_grade"
    t.integer  "teacher_id"
    t.string   "subject"
    t.text     "auto_feedback"
    t.string   "subcategory"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["teacher_id"], name: "index_generated_feedbacks_on_teacher_id", using: :btree
  end

  create_table "maths_grades", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.string   "title"
    t.string   "subcategory"
    t.string   "performance_grade"
    t.text     "feedback"
    t.datetime "grade_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["student_id"], name: "index_maths_grades_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_maths_grades_on_teacher_id", using: :btree
  end

  create_table "shortcut_texts", force: :cascade do |t|
    t.integer  "teacher_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_shortcut_texts_on_teacher_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "subject"
    t.text     "task"
    t.integer  "teacher_id"
    t.date     "due_date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["teacher_id"], name: "index_tasks_on_teacher_id", using: :btree
  end

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "audience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "type"
    t.string   "teacher_name"
    t.string   "teacher_email"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "english_grades", "users", column: "student_id"
  add_foreign_key "english_grades", "users", column: "teacher_id"
  add_foreign_key "generated_feedbacks", "users", column: "teacher_id"
  add_foreign_key "maths_grades", "users", column: "student_id"
  add_foreign_key "maths_grades", "users", column: "teacher_id"
  add_foreign_key "shortcut_texts", "users", column: "teacher_id"
  add_foreign_key "tasks", "users", column: "teacher_id"
end
