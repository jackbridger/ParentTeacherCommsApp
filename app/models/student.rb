class Student < User
    has_many :grades
    has_many :maths_grades
    has_many :english_grades
end
