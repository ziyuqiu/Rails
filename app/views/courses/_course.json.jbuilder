json.extract! course, :id, :name, :requirements, :description, :code, :created_at, :updated_at
json.url course_url(course, format: :json)
