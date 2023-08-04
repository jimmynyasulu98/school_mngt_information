class AddSurnameToGuardian < ActiveRecord::Migration[7.0]
  def change
    add_column :guardians, :surname, :string
  end
end
