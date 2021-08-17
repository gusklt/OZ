class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :performance

  validates :date, :status, presence: true
end
