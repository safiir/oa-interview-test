json.extract! student, :id, :name, :bio, :gender, :created_at, :updated_at
json.url student_url(student, format: :json)
