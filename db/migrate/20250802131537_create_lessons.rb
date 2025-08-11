class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :introduction
      t.text :body
      t.text :summary

      t.timestamps
    end
  end
end
