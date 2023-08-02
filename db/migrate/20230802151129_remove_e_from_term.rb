class RemoveEFromTerm < ActiveRecord::Migration[7.0]
  def change
    remove_column :terms, :e, :string
  end
end
