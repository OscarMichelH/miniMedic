json.extract! doctor, :id, :area_id, :firstname, :lastname, :dob, :gender, :speciality, :yearsexperience, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
