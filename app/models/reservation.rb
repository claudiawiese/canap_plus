class Reservation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :quantity, presence: true
end
