class AddTermNumberToTerm < ActiveRecord::Migration[7.0]
  def change
    add_column :terms, :term_number, :integer, after: :id
  end
end
