class Level < ApplicationRecord
  has_many :segments, dependent: :destroy
end
