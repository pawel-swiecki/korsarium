class DropLevels < ActiveRecord::Migration[8.0]
  def change
    drop_table :levels
  end
end
