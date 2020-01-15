class AddSlugToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :slug, :string
  end
end
