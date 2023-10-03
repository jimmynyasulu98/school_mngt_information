class AddAsseGradeIdToAssessment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assessments, :assessment_grade, null: true, foreign_key: true, default: :null, after: :score
  end
end
