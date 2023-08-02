class CreateStaffSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :staff_salaries do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
