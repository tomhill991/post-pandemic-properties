class AddIImageableToImages < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
