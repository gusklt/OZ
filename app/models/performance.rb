class Performance < ApplicationRecord
  belongs_to :user

  validates :title, :location, :description, :user_id, :price, presence: true

  has_one_attached :photo
end
