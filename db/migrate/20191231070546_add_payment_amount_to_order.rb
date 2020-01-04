class AddPaymentAmountToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :paid_amount, :float, default: 0.0
    add_column :orders, :delivery_fee, :float, default: 0.0
    rename_column :orders, :amount, :price
  end

  def up
    change_column :orders, :currency, :string, default: 'BDT'
    change_column :orders, :price, :float, default: 0.0
  end

  def down
    change_column :orders, :currency, :string, default: nil
    change_column :orders, :price, :float, default: nil
  end
end
