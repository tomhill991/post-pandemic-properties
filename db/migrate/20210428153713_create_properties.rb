class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :max_guests
      t.integer :office_size
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :description
      t.string :string
      t.float :average_rating
      t.boolean :has_beach_nearby
      t.boolean :has_beds
      t.boolean :has_kitchen
      t.boolean :has_simming_pool
      t.boolean :has_hdtv
      t.boolean :has_bathtub

      t.timestamps
    end
  end
end
