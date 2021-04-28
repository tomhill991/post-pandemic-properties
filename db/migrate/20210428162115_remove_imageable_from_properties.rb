class RemoveImageableFromProperties < ActiveRecord::Migration[6.1]
  def change
    change_table :properties do |t|
      t.remove_references :imageable, :polymorphic => true
    end
  end
end
