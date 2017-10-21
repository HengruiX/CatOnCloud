class RemoveSubscribesFromUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :subscribes, :integer
  end
end
