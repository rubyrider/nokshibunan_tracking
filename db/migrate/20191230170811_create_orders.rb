class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, optional: true, foreign_key: true
      t.text :address
      t.float :amount
      t.string :currency
      t.string :product_name
      t.text :product_detail
      t.text :product_image
      t.datetime :order_date
      t.datetime :estimated_delivery_date
      t.integer :payment_status
      t.references :payment_method, null: false, foreign_key: true
      t.references :tracking_status, null: false, foreign_key: true
      t.references :delivery_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
