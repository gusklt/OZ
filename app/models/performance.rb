class Performance < ApplicationRecord
  belongs_to :user

  validates :title, :location, :description, presence: true
end
