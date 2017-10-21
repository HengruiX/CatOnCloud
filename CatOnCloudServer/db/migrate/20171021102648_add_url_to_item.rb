class AddUrlToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :Url, :text
  end
end
