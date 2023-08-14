class CreateAssessmentGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_grades do |t|
      t.decimal :start_mark
      t.decimal :end_mark
      t.string :grade

      t.timestamps
    end
  end
end
