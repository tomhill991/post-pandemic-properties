class FixColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :properties_id, :property_id
    rename_column :bookings, :reviews_id, :review_id
    rename_column :bookings, :users_id, :user_id
  end
end
