class AddDefaultValuesToAssessmentType < ActiveRecord::Migration[7.0]
  def change
    change_column :assessment_types, :grade, :boolean, default: :false
    change_column :assessment_types, :end_of_term, :boolean, default: :false
  end
end
