class Segment < ApplicationRecord
  has_many :lessons, dependent: :destroy
end
