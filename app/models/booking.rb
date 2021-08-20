class Booking < ApplicationRecord
  belongs_to :user
  has_many :reviews
  belongs_to :performance

  validates :date, presence: true
  validates :status, inclusion: { in: %w[accepted pending declined] }
end
