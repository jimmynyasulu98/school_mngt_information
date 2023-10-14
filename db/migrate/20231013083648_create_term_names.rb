class CreateTermNames < ActiveRecord::Migration[7.0]
  def change
    create_table :term_names do |t|
      t.integer :title

      t.timestamps
    end
  end
end
