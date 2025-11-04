class Textbook < ApplicationRecord
  has_one_attached :textbook_icon

  belongs_to :level
  has_many :lessons
end
