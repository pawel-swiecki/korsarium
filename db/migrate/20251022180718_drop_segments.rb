class DropSegments < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :lessons, :segments
    remove_foreign_key :segments, :levels
    drop_table :segments
  end
end
