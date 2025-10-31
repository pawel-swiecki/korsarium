class Level < ApplicationRecord
  has_one_attached :level_icon

  belongs_to :segment
  has_one :textbook
end
