class AddDetailToAssessmentType < ActiveRecord::Migration[7.0]
  def change
    add_column :assessment_types, :submitted, :boolean, default: :false
  end
end
