class Course < ApplicationRecord
  has_one :library

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
end
