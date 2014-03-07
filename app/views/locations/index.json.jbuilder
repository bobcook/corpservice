json.array!(@locations) do |location|
  json.extract! location, :id, :code, :address1, :address2, :city, :state, :zip, :phone, :email
  json.url location_url(location, format: :json)
end
