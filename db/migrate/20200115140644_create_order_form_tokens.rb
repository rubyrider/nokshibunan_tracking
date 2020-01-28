class CreateOrderFormTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :order_form_tokens do |t|
      t.references :order, foreign_key: true
      t.text :token
      t.integer :expire_unit, default: 0
      t.integer :expire_at, default: 30
      t.boolean :is_valid, default: true

      t.timestamps
    end
  end
end
