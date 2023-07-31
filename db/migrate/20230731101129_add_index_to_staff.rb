class AddIndexToStaff < ActiveRecord::Migration[7.0]
  def change
  end
  remove_index :staffs, :email,                unique: true
end
