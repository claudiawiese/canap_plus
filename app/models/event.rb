class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :capacity, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_game,
    against: [:game],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
