class AddDefaultToSubject < ActiveRecord::Migration[7.0]
  def change
    change_column :subjects, :compulsory, :boolean, default: :false
  end
end
