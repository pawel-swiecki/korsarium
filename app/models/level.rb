class Level < ApplicationRecord
  belongs_to :segment
  has_one :textbook
end
