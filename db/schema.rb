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

ActiveRecord::Schema[7.0].define(version: 2023_07_31_165003) do
  create_table "academic_years", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessment_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "staff_id", null: false
    t.bigint "assessment_type_id", null: false
    t.bigint "form_id", null: false
    t.bigint "term_id", null: false
    t.decimal "score", precision: 10, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_type_id"], name: "index_assessments_on_assessment_type_id"
    t.index ["form_id"], name: "index_assessments_on_form_id"
    t.index ["staff_id"], name: "index_assessments_on_staff_id"
    t.index ["student_id"], name: "index_assessments_on_student_id"
    t.index ["term_id"], name: "index_assessments_on_term_id"
  end

  create_table "forms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guardian_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guardians", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.date "date_of_birth"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_staff_subjects_on_form_id"
    t.index ["staff_id"], name: "index_staff_subjects_on_staff_id"
    t.index ["subject_id"], name: "index_staff_subjects_on_subject_id"
    t.index ["term_id"], name: "index_staff_subjects_on_term_id"
  end

  create_table "staffs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "username", default: "", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "surname"
    t.date "date_of_birth"
    t.date "date_of_appointment"
    t.string "phone_number"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "marital_status"
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
    t.index ["username"], name: "index_staffs_on_username", unique: true
  end

  create_table "student_forms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "form_id", null: false
    t.bigint "academic_year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_student_forms_on_academic_year_id"
    t.index ["form_id"], name: "index_student_forms_on_form_id"
    t.index ["student_id"], name: "index_student_forms_on_student_id"
  end

  create_table "student_guardians", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "Student_id", null: false
    t.bigint "Guardian_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guardian_type_id", null: false
    t.index ["Guardian_id"], name: "index_student_guardians_on_Guardian_id"
    t.index ["Student_id"], name: "index_student_guardians_on_Student_id"
    t.index ["guardian_type_id"], name: "index_student_guardians_on_guardian_type_id"
  end

  create_table "student_subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_student_subjects_on_form_id"
    t.index ["student_id"], name: "index_student_subjects_on_student_id"
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id"
    t.index ["term_id"], name: "index_student_subjects_on_term_id"
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "surname"
    t.string "date_of_birth"
    t.date "date_of_enrollment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["username"], name: "index_students_on_username", unique: true
  end

  create_table "subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "compulsory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "term_number"
    t.bigint "academic_year_id", null: false
    t.date "start_date"
    t.date "e"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_terms_on_academic_year_id"
  end

  add_foreign_key "assessments", "assessment_types"
  add_foreign_key "assessments", "forms"
  add_foreign_key "assessments", "staffs"
  add_foreign_key "assessments", "students"
  add_foreign_key "assessments", "terms"
  add_foreign_key "staff_subjects", "forms"
  add_foreign_key "staff_subjects", "staffs"
  add_foreign_key "staff_subjects", "subjects"
  add_foreign_key "staff_subjects", "terms"
  add_foreign_key "student_forms", "academic_years"
  add_foreign_key "student_forms", "forms"
  add_foreign_key "student_forms", "students"
  add_foreign_key "student_guardians", "guardian_types"
  add_foreign_key "student_guardians", "guardians", column: "Guardian_id"
  add_foreign_key "student_guardians", "students", column: "Student_id"
  add_foreign_key "student_subjects", "forms"
  add_foreign_key "student_subjects", "students"
  add_foreign_key "student_subjects", "subjects"
  add_foreign_key "student_subjects", "terms"
  add_foreign_key "terms", "academic_years"
end
