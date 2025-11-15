class DropLessons < ActiveRecord::Migration[8.0]
  def change
    drop_table :lessons
  end
end
