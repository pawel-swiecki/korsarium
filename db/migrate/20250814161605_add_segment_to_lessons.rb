class AddSegmentToLessons < ActiveRecord::Migration[8.0]
  def change
    add_reference :lessons, :segment, null: true, foreign_key: true
  end
end
