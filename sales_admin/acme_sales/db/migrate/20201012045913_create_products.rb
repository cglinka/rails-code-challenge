class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :description, null: false
      t.decimal :price, null: false

      t.index [:description, :price], unique: true

      t.timestamps
    end
  end
end
