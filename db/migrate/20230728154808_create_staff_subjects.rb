class CreateStaffSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :staff_subjects do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
