class AddDetailsToSubject < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :crucial, :boolean, default: :false, after: :compulsory
  end
end
