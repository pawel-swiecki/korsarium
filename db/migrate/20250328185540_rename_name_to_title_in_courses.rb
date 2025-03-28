class RenameNameToTitleInCourses < ActiveRecord::Migration[8.0]
  def change
    rename_column :courses, :name, :title
  end
end
