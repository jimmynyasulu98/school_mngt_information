class AddTitleToStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :title, :string, after: :id
  end
end
