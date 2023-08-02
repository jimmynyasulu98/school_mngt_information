class AddEndDateToTerm < ActiveRecord::Migration[7.0]
  def change
    add_column :terms, :end_date, :date, after: :start_date
  end
end
