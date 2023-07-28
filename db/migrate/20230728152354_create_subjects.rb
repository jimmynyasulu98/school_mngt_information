class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.boolean :compulsory

      t.timestamps
    end
  end
end
