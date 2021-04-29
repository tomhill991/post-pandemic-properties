class Property < ApplicationRecord
  belongs_to :user_id
  has_many :reviews, through: :bookings, dependant: :destroy
  has_many :images, { as: :imageable }
end
