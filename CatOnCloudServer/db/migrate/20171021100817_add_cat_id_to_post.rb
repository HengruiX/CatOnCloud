class AddCatIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :cat_id, :integer
  end
end
