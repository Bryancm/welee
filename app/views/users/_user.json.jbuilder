json.extract! user, :id, :name, :lastName, :phone, :typeu, :street, :exterior_number, :interior_number, :city, :state, :zip, :created_at, :updated_at
json.url user_url(user, format: :json)
