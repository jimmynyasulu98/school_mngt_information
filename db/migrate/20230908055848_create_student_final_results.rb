class CreateStudentFinalResults < ActiveRecord::Migration[7.0]
  def change

    create_table :student_final_results do |t|
      t.references :student, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.decimal :total_marks
      t.string :final_letter_grade
      t.string :final_remark

      t.timestamps
    end
  end
end
