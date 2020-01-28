class AddLastAccessAtToOrderFormTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :order_form_tokens, :accessed_at, :datetime
    remove_column :order_form_tokens, :is_valid, :boolean, default: true
  end
end
