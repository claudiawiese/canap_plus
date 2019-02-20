class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations

  mount_uploader :photo, PhotoUploader
end
