class RenameBookingsToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_table :bookings, :reviews
  end
end
