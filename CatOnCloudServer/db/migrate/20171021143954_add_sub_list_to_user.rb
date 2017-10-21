class AddSubListToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :sublist, :text
  end
end
