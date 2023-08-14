class AddDetailsToAssessmentType < ActiveRecord::Migration[7.0]
  def change
    add_reference :assessment_types, :term, null: false, foreign_key: true
    add_column :assessment_types, :madatory, :boolean
    add_column :assessment_types, :end_of_term, :boolean
    add_column :assessment_types, :grade, :boolean
  end
end
