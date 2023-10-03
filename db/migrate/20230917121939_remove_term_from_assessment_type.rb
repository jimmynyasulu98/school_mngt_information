class RemoveTermFromAssessmentType < ActiveRecord::Migration[7.0]
  def change
    remove_column :assessment_types, :term_id, :string
    remove_column :assessment_types, :submitted, :boolean
    remove_column :assessment_types, :grade, :boolean
  end
end
