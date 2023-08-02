class RemoveTermNumberFromTerm < ActiveRecord::Migration[7.0]
  def change
    remove_column :terms, :term_number, :string
  end
end
