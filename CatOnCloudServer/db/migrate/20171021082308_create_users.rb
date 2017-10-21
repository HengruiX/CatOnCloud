class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :intro
      t.text :subscribed

      t.timestamps
    end
  end
end
