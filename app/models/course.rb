class Course < ApplicationRecord
  has_one :library

  has_one_attached :course_icon

  validates :title, presence: true
  validates :subtitle, presence: true
end
