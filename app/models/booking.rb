class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :performance

  validates :date, presence: true
  validates :status, inclusion: { in: %w[accepted pending declined] }
end
