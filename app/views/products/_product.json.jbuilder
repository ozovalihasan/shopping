json.extract! product, :id, :color, :description, :quantity, :price, :review_count, :average_rate, :name, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
