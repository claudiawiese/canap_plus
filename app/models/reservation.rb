class Reservation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  after_save :update_capacity
end
