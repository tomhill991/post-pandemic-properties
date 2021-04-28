class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
