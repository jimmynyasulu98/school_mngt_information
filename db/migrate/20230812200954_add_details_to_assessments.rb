class AddDetailsToAssessments < ActiveRecord::Migration[7.0]
  def change
    add_column :assessments, :submitted, :boolean, default: false
    add_column :assessments, :approved, :boolean, default: false
  end
end
