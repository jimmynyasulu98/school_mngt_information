class RemoveAcademicYearIdFromStudentForm < ActiveRecord::Migration[7.0]
  def change
    remove_column :student_forms, :academic_year_id, :string
  end
end
