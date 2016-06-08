class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :image, null: false
      t.string :title
      t.string :difficulty

      t.timestamps null: false
    end
  end
end
