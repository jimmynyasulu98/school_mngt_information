class AddFinalRemarkFromStudentFinalResult < ActiveRecord::Migration[7.0]
  def change
    add_column :student_final_results, :final_remark, :boolean, default: :false,after: :best_subjects_total
  end
end
