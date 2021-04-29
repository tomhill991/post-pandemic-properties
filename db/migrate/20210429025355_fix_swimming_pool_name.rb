class FixSwimmingPoolName < ActiveRecord::Migration[6.1]
  def change
    rename_column :properties, :has_simming_pool, :has_swimming_pool
  end
end
