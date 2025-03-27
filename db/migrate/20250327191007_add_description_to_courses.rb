class AddDescriptionToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :description, :text
  end
end
