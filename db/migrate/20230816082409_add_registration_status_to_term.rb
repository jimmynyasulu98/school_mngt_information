class AddRegistrationStatusToTerm < ActiveRecord::Migration[7.0]
  def change
    add_column :terms, :registration_open, :boolean, default: false, after: :academic_year_id
  end
end
