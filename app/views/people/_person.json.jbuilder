json.extract! person, :id, :firstname, :lastname, :dob, :gender, :created_at, :updated_at
json.url person_url(person, format: :json)
