class AddTermToStudentForm < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_forms, :term, null: false, foreign_key: true, after: :form_id
  end
end
