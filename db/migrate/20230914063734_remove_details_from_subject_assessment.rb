class RemoveDetailsFromSubjectAssessment < ActiveRecord::Migration[7.0]
  def change
    remove_column :subject_assessments, :staff_id, :string
    remove_column :subject_assessments, :form_id, :string
    remove_column :subject_assessments, :term_id, :string
  end
end
