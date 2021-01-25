class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :total_payment
      t.integer :shipping_cost, default: 800
      t.string :name
      t.string :address
      t.string :post_code
      t.integer :status

      t.integer :payment_method

      t.timestamps
    end
  end
end
