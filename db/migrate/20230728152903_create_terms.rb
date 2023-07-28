class CreateTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :terms do |t|
      t.string :term_number
      t.references :academic_year, null: false, foreign_key: true
      t.date :start_date
      t.date :e

      t.timestamps
    end
  end
end
