class RenameNameToForm < ActiveRecord::Migration[7.0]
  def change
    change_column :forms, :name, :integer
  end
end
