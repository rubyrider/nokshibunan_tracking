json.extract! product, :id, :title, :image, :detail, :price, :currency, :created_at, :updated_at
json.url product_url(product, format: :json)
