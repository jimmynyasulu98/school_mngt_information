class AddDetailsToStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :gender, :string
    add_column :staffs, :marital_status, :string
  end
end
