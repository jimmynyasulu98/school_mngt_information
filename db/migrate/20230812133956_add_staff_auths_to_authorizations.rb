class AddStaffAuthsToAuthorizations < ActiveRecord::Migration[7.0]
  def change
    add_column :authorizations, :staff_auths, :boolean ,after: :staff_id, default: false
  end
end
