class AddRegistrationStatusToRegistration < ActiveRecord::Migration[7.0]
  def change
    add_column :registrations, :registered, :boolean, default: false, after: :form_id
  end
end
