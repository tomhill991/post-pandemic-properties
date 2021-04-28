class AddImageableToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :imageable, polymorphic: true, null: false
  end
end
