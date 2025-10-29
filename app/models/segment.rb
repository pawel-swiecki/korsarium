class Segment < ApplicationRecord
  has_one_attached :segment_icon

  belongs_to :course
  has_many :levels
end
