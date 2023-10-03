class RemoveFinalRemarkFromStudentFinalResult < ActiveRecord::Migration[7.0]
  def change
    remove_column :student_final_results, :final_remark, :string
  end
end
