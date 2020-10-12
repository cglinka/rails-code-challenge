json.extract! merchant, :id, :merchant_name, :merchant_address, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
