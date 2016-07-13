json.array!(@maths_grades) do |maths_grade|
  json.extract! maths_grade, :id, :teacher_id, :student_id, :title, :subcategory, :performance_grade, :feedback, :grade_date
  json.url maths_grade_url(maths_grade, format: :json)
end
