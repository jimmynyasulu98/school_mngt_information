class AddDefaultToAssessment < ActiveRecord::Migration[7.0]
  def change
    change_column :assessments, :score, :decimal, default: :nil
  end
end
