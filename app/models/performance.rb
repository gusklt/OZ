class Performance < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :location, :description, :user_id, :price, presence: true

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
