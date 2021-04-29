class Property < ApplicationRecord
  belongs_to :users
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :images, { as: :imageable }, dependent: :destroy
end
