class AddDetailsToStaffSubject < ActiveRecord::Migration[7.0]
  def change
    add_column :staff_subjects, :core_teacher, :boolean, default: :false, after: :form_id
  end
end
