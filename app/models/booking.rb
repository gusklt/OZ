class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :performance
  belongs_to :user, through: :performance

  validates :date, :status, presence: true
end
