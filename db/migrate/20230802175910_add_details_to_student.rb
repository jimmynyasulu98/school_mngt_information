class AddDetailsToStudent < ActiveRecord::Migration[7.0]
  def change

    add_column :students, :TA, :string
    add_column :students, :village, :string
  end
end
