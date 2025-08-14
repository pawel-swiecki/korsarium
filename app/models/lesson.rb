class Lesson < ApplicationRecord
  belongs_to :segment, optional: true
end
