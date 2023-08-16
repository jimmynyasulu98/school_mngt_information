class AddApprovalToStudentSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :student_subjects, :approved, :boolean, default: false
  end
end
