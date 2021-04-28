class AddUserIdToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :user, index: true
  end
end
