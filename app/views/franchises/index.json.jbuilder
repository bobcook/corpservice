json.array!(@franchises) do |franchise|
  json.extract! franchise, :id, :number, :name, :phone, :email, :location_id
  json.url franchise_url(franchise, format: :json)
end
