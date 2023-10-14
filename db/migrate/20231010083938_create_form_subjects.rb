class CreateFormSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :form_subjects do |t|
      t.references :form, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
