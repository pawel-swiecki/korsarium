class CreateLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :levels do |t|
      t.string :title
      t.references :segment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
