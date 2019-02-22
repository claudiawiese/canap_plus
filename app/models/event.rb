class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :game, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :capacity, presence: true
  validates :address, presence: true
  validates :fee, presence: true
  validates :photo, presence: true
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
