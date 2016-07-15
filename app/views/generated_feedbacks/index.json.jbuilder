json.array!(@generated_feedbacks) do |generated_feedback|
  json.extract! generated_feedback, :id, :performance_grade, :teacher_id, :subject, :auto_feedback, :subcategory
  json.url generated_feedback_url(generated_feedback, format: :json)
end
