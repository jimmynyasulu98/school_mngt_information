class AddAssessmentGradeIdToAssessment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assessments, :assessment_grade, foreign_key: true,default: :nil, after: :score
  end
end
