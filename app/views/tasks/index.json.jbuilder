json.array!(@tasks) do |task|
  json.extract! task, :id, :subject, :task, :teacher_id, :due_date, :description
  json.url task_url(task, format: :json)
end
