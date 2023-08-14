class RemoveStaffFromAuthorizations < ActiveRecord::Migration[7.0]
  def change
    remove_column :authorizations, :staff, :boolean
    remove_column :authorizations, :staff_category, :boolean
  end
end
