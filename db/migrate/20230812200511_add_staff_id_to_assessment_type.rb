class AddStaffIdToAssessmentType < ActiveRecord::Migration[7.0]
  def change
    add_reference :assessment_types, :staff, null: false, foreign_key: true
  end
end
