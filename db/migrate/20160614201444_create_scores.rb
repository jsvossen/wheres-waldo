class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.references :puzzle, index: true, foreign_key: true, null: false
      t.decimal :seconds, precision: 6, scale: 1, null: false

      t.timestamps null: false
    end
  end
end
