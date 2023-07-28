class CreateStudentForms < ActiveRecord::Migration[7.0]
  def change
    create_table :student_forms do |t|
      t.references :student, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.references :academic_year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
