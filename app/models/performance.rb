class Performance < ApplicationRecord
  belongs_to :user

  validates :title, :location, :description, :user_id, :price, presence: true
end
