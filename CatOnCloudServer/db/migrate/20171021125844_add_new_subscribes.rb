class AddNewSubscribes < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :subscribes, :integer, array: true
  end
end
