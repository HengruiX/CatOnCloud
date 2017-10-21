class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.text :name
      t.text :description
      t.text :picsUrl
      t.float :rate
      t.text :location

      t.timestamps
    end
  end
end
