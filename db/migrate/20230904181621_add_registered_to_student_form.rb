class AddRegisteredToStudentForm < ActiveRecord::Migration[7.0]
  def change
    add_column :student_forms, :registered, :boolean, default: :false, after: :term_id
  end
end
