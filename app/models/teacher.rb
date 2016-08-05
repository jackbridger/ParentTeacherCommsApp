class Teacher < User
    has_many :grades
    has_many :maths_grades
    has_many :english_grades
    has_many :generated_feedback
    has_many :task
    has_many :shortcut_text
end
