class AddFacebookUrlToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :facebook_url, :text
    add_column :orders, :discount, :float
  end
end
