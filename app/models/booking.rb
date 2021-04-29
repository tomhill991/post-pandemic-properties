class Booking < ApplicationRecord
  belongs_to :property_id
  belongs_to :user_id
  belongs_to :review_id, dependant: :destroy
end
