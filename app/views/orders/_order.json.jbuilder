json.extract! order, :id, :address, :amount, :currency, :product_name, :product_detail, :order_date, :estimated_delivery, :status_id_id, :payment_status, :payment_method_id, :created_at, :updated_at
json.url order_url(order, format: :json)
