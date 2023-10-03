class AddRemarkToAssessmentGrade < ActiveRecord::Migration[7.0]
  def change
    add_column :assessment_grades, :remark, :boolean,default: :false, after: :grade
  end
end
