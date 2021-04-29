class Booking < ApplicationRecord
  belongs_to :property_id
  belongs_to :user_id
  has_one :review
end
