json.extract! article, :id, :name, :description, :price, :animal_id, :articlecat_id, :active, :photo, :created_at, :updated_at
json.url article_url(article, format: :json)
