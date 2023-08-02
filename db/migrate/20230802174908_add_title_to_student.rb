class AddTitleToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :title, :string, after: :id
  end
end
