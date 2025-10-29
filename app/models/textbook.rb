class Textbook < ApplicationRecord
  belongs_to :level
  has_many :lessons
end
