class AddSubscriptionToCat < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :subscription, :integer
  end
end
