class Performance < ApplicationRecord
  belongs_to :user

  validates :title, :location, :description, :user_id, presence: true
end
