class DropLibraries < ActiveRecord::Migration[8.0]
  def change
    drop_table :libraries
  end
end
