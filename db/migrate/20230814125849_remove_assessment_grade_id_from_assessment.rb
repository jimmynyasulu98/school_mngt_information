class RemoveAssessmentGradeIdFromAssessment < ActiveRecord::Migration[7.0]
  def change
    remove_column :assessments, :assessment_grade_id, :string
  end
end
