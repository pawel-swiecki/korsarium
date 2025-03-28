class AddSubtitleToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :subtitle, :string
  end
end
