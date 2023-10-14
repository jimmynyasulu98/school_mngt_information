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

ActiveRecord::Schema[7.0].define(version: 2023_10_13_083648) do
  create_table "academic_years", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessment_grades", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "start_mark", precision: 10
    t.decimal "end_mark", precision: 10
    t.string "grade"
    t.boolean "remark", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessment_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mandatory", default: false
    t.boolean "end_of_term", default: false
    t.bigint "staff_id", null: false
    t.boolean "released", default: false
    t.bigint "term_id", null: false
    t.index ["staff_id"], name: "index_assessment_types_on_staff_id"
    t.index ["term_id"], name: "index_assessment_types_on_term_id"
  end

  create_table "assessments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "subject_assessment_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "student_id", null: false
    t.bigint "staff_id", null: false
    t.bigint "assessment_type_id", null: false
    t.bigint "form_id", null: false
    t.bigint "term_id", null: false
    t.decimal "score", precision: 10
    t.bigint "assessment_grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "submitted", default: false
    t.boolean "approved", default: false
    t.index ["assessment_grade_id"], name: "index_assessments_on_assessment_grade_id"
    t.index ["assessment_type_id"], name: "index_assessments_on_assessment_type_id"
    t.index ["form_id"], name: "index_assessments_on_form_id"
    t.index ["staff_id"], name: "index_assessments_on_staff_id"
    t.index ["student_id"], name: "index_assessments_on_student_id"
    t.index ["subject_assessment_id"], name: "index_assessments_on_subject_assessment_id"
    t.index ["subject_id"], name: "index_assessments_on_subject_id"
    t.index ["term_id"], name: "index_assessments_on_term_id"
  end

  create_table "authorizations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.boolean "staff_auths", default: false
    t.boolean "student", default: false
    t.boolean "guardian", default: false
    t.boolean "academic_year", default: false
    t.boolean "term", default: false
    t.boolean "form", default: false
    t.boolean "subject", default: false
    t.boolean "staff_subject", default: false
    t.boolean "student_subject", default: false
    t.boolean "assessment", default: false
    t.boolean "assessment_type", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_authorizations_on_staff_id"
  end

  create_table "form_subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_subjects_on_form_id"
    t.index ["subject_id"], name: "index_form_subjects_on_subject_id"
  end

  create_table "forms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "grade"
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
    t.string "surname"
    t.string "gender"
  end

  create_table "registrations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.boolean "registered", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_registrations_on_form_id"
    t.index ["student_id"], name: "index_registrations_on_student_id"
    t.index ["term_id"], name: "index_registrations_on_term_id"
  end

  create_table "results_final_gradings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "final_grade", precision: 10
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_salaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.bigint "grade_id", null: false
    t.decimal "amount", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_staff_salaries_on_grade_id"
    t.index ["staff_id"], name: "index_staff_salaries_on_staff_id"
  end

  create_table "staff_subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.boolean "core_teacher", default: false
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
    t.bigint "staff_category_id", null: false
    t.boolean "staff", default: false
    t.boolean "staff_category", default: false
    t.boolean "student", default: false
    t.boolean "guardian", default: false
    t.boolean "academic_year", default: false
    t.boolean "term", default: false
    t.boolean "form", default: false
    t.boolean "subject", default: false
    t.boolean "staff_subject", default: false
    t.boolean "student_subject", default: false
    t.boolean "assessment", default: false
    t.boolean "assessment_type", default: false
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
    t.index ["staff_category_id"], name: "index_staffs_on_staff_category_id"
    t.index ["username"], name: "index_staffs_on_username", unique: true
  end

  create_table "student_final_results", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "assessment_type_id", null: false
    t.bigint "student_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.decimal "total_marks", precision: 10
    t.decimal "best_subjects_total", precision: 10
    t.boolean "final_remark", default: false
    t.string "final_letter_grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_type_id"], name: "index_student_final_results_on_assessment_type_id"
    t.index ["form_id"], name: "index_student_final_results_on_form_id"
    t.index ["student_id"], name: "index_student_final_results_on_student_id"
    t.index ["term_id"], name: "index_student_final_results_on_term_id"
  end

  create_table "student_forms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "form_id", null: false
    t.bigint "term_id", null: false
    t.boolean "registered", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_student_forms_on_form_id"
    t.index ["student_id"], name: "index_student_forms_on_student_id"
    t.index ["term_id"], name: "index_student_forms_on_term_id"
  end

  create_table "student_guardians", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "guardian_id", null: false
    t.bigint "guardian_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guardian_id"], name: "index_student_guardians_on_guardian_id"
    t.index ["guardian_type_id"], name: "index_student_guardians_on_guardian_type_id"
    t.index ["student_id"], name: "index_student_guardians_on_student_id"
  end

  create_table "student_subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.index ["form_id"], name: "index_student_subjects_on_form_id"
    t.index ["student_id"], name: "index_student_subjects_on_student_id"
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id"
    t.index ["term_id"], name: "index_student_subjects_on_term_id"
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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
    t.string "date_of_birth"
    t.date "date_of_enrollment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "phone_number"
    t.string "district"
    t.string "TA"
    t.string "village"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["username"], name: "index_students_on_username", unique: true
  end

  create_table "subject_assessments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "staff_subject_id", null: false
    t.bigint "assessment_type_id", null: false
    t.boolean "submitted", default: false
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_type_id"], name: "index_subject_assessments_on_assessment_type_id"
    t.index ["staff_subject_id"], name: "index_subject_assessments_on_staff_subject_id"
  end

  create_table "subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "compulsory", default: false
    t.boolean "crucial", default: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_subjects_on_form_id"
  end

  create_table "term_names", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "term_number"
    t.bigint "academic_year_id", null: false
    t.boolean "registration_open", default: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "term_name_id", null: false
    t.index ["academic_year_id"], name: "index_terms_on_academic_year_id"
    t.index ["term_name_id"], name: "index_terms_on_term_name_id"
  end

  add_foreign_key "assessment_types", "staffs"
  add_foreign_key "assessments", "assessment_grades"
  add_foreign_key "assessments", "assessment_types"
  add_foreign_key "assessments", "forms"
  add_foreign_key "assessments", "staffs"
  add_foreign_key "assessments", "students"
  add_foreign_key "assessments", "subject_assessments"
  add_foreign_key "assessments", "subjects"
  add_foreign_key "authorizations", "staffs"
  add_foreign_key "form_subjects", "forms"
  add_foreign_key "form_subjects", "subjects"
  add_foreign_key "registrations", "forms"
  add_foreign_key "registrations", "students"
  add_foreign_key "registrations", "terms"
  add_foreign_key "staff_salaries", "grades"
  add_foreign_key "staff_salaries", "staffs"
  add_foreign_key "staff_subjects", "forms"
  add_foreign_key "staff_subjects", "staffs"
  add_foreign_key "staff_subjects", "subjects"
  add_foreign_key "staff_subjects", "terms"
  add_foreign_key "student_final_results", "forms"
  add_foreign_key "student_final_results", "students"
  add_foreign_key "student_final_results", "terms"
  add_foreign_key "student_forms", "forms"
  add_foreign_key "student_forms", "students"
  add_foreign_key "student_forms", "terms"
  add_foreign_key "student_guardians", "guardian_types"
  add_foreign_key "student_guardians", "guardians"
  add_foreign_key "student_guardians", "students"
  add_foreign_key "student_subjects", "forms"
  add_foreign_key "student_subjects", "students"
  add_foreign_key "student_subjects", "subjects"
  add_foreign_key "student_subjects", "terms"
  add_foreign_key "subject_assessments", "assessment_types"
  add_foreign_key "subject_assessments", "staff_subjects"
  add_foreign_key "terms", "academic_years"
end
