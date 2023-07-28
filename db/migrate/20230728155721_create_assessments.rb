class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true
      t.references :assessment_type, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.decimal :score, default: 0.0

      t.timestamps
    end
  end
end
