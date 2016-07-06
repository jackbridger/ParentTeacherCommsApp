json.array!(@grades) do |grade|
  json.extract! grade, :id, :student_id, :teacher_id, :feedback, :percentage_score, :grade_type, :grade_letter, :grade_date, :subject
  json.url grade_url(grade, format: :json)
end
