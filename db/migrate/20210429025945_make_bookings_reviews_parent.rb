class MakeBookingsReviewsParent < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :booking, index: true
    remove_reference :bookings, :review, index: true, foreign_key: true
  end
end
