class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.string :name
    end
  end
end
