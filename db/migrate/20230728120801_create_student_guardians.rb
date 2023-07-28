class CreateStudentGuardians < ActiveRecord::Migration[7.0]
  def change
    create_table :student_guardians do |t|
      t.references :Student, null: false, foreign_key: true
      t.references :Guardian, null: false, foreign_key: true


      t.timestamps
    end
  end
end
