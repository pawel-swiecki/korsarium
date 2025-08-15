class Level < ApplicationRecord
  has_many :segments, dependent: :destroy
  belongs_to :course, optional: true
end
