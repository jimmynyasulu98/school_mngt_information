class AddBestSubjectsTotalToStudentFinalResult < ActiveRecord::Migration[7.0]
  def change
    add_column :student_final_results, :best_subjects_total, :decimal, after: :total_marks
  end
end
