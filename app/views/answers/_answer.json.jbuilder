json.extract! answer, :id, :question_id, :answer, :active, :created_at, :updated_at
json.url answer_url(answer, format: :json)
