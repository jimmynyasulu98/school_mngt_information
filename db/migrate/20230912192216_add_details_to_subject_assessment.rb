class AddDetailsToSubjectAssessment < ActiveRecord::Migration[7.0]
  def change

    add_reference :subject_assessments, :term, null: false, foreign_key: true, after: :staff_id
    add_reference :subject_assessments, :form, null: false, foreign_key: true, after: :assessment_type_id
  end
end
