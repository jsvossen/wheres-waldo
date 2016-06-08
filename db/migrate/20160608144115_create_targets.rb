class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.references :puzzle, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
