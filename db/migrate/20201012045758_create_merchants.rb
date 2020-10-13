class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :merchant_name, null: false
      t.string :merchant_address, null: false

      t.index [:merchant_name, :merchant_address], unique: true
      t.timestamps
    end
  end
end
