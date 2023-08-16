class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
