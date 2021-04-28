class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :uri
      t.integer :file_size

      t.timestamps
    end
  end
end
