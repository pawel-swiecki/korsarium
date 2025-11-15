class AddSubtitleToSegment < ActiveRecord::Migration[8.0]
  def change
    add_column :segments, :subtitle, :string
  end
end
