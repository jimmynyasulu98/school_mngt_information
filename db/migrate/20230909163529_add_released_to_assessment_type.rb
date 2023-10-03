class AddReleasedToAssessmentType < ActiveRecord::Migration[7.0]
  def change
    add_column :assessment_types, :released, :boolean, default: :false
  end
end
