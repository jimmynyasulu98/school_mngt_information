class CreateGuardians < ActiveRecord::Migration[7.0]
  def change
    create_table :guardians do |t|
      t.string :first_name
      t.string :middle_name
      t.date :date_of_birth
      t.string :phone_number

      t.timestamps
    end
  end
end
