class Performance < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :location, :description, :user_id, :price, presence: true

  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch do
    attributes :title, :description, :user # :location
  end
end
