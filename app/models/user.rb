class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :events, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, PhotoUploader

  validates :nickname, uniqueness: true, presence: true
  validates :team, presence: true
end
