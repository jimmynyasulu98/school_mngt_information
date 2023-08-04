class AddGenderToGuardian < ActiveRecord::Migration[7.0]
  def change
    add_column :guardians, :gender, :string
  end
end
