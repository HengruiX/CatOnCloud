class RemoveFieldNameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :subscribed, :string
  end
end
