class AddCostToDeliveryMethods < ActiveRecord::Migration[6.0]
  def change
    add_column :delivery_methods, :cost, :float, default: 0.0
  end
end
