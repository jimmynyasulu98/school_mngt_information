class AddAssessmentGradeToAssessment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assessments, :assessment_grade, null: false, foreign_key: true, after: :score
  end
end
