class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.numeric :quantity
      t.references :merchant, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
