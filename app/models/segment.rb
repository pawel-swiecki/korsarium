class Segment < ApplicationRecord
  has_many :lessons, dependent: :destroy
  belongs_to :level, optional: true
end
