class CreateTextbooks < ActiveRecord::Migration[8.0]
  def change
    create_table :textbooks do |t|
      t.references :level, null: false, foreign_key: true
      t.string :title
      t.text :subtitle

      t.timestamps
    end
  end
end
