class ChangeColumnNameToAssessmentType < ActiveRecord::Migration[7.0]
  def change
    rename_column :assessment_types, :madatory, :mandatory
  end
end
