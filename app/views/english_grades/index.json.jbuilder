json.array!(@english_grades) do |english_grade|
  json.extract! english_grade, :id, :teacher_id, :student_id, :title, :subcategory, :performance_grade, :feedback, :grade_date
  json.url english_grade_url(english_grade, format: :json)
end
