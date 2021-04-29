class Property < ApplicationRecord
  belongs_to :users
  has_many :reviews, through: :bookings, dependant: :destroy
  has_many :images, { as: :imageable }, dependant: :destroy
end
