class CreateAssessmentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
