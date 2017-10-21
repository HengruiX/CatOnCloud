class DeleteSubscribedLastTime < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :subscribed, :integer
  end
end
