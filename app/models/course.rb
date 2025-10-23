class Course < ApplicationRecord
  has_one_attached :course_icon
  has_many :segments, dependent: :destroy

  validates :title, presence: true
  validates :subtitle, presence: true
end
