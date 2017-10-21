class RemoveFieldNameFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :Url, :text
  end
end
