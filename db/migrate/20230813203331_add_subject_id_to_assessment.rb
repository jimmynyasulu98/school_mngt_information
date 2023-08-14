class AddSubjectIdToAssessment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assessments, :subject, null: false, foreign_key: true, after: :id
  end
end
