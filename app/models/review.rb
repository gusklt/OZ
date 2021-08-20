class Review < ApplicationRecord
  belongs_to :booking

  validates :comment, length: { minimum: 3 }
  validates :rating, inclusion: { in: 1..5 }
end
