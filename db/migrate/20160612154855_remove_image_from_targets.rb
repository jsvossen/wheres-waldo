class RemoveImageFromTargets < ActiveRecord::Migration
  def change
  	remove_column :targets, :image
  end
end
