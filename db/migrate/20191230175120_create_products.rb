class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :image
      t.text :detail
      t.float :price
      t.string :currency

      t.timestamps
    end
  end
end
