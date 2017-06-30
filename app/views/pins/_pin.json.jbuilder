json.extract! pin, :id, :name, :address, :lat, :lng, :created_at, :updated_at
json.url pin_url(pin, format: :json)
