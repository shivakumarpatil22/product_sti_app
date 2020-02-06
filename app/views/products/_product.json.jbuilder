json.extract! product, :id, :name, :price, :type, :inward_date, :color, :created_at, :updated_at
json.url product_url(product, format: :json)
