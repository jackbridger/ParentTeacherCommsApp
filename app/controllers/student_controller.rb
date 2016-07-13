class StudentController < ApplicationController

    def index
        @teacher = Teacher.where('email' => current_user.teacher_email)
        @all_english_grades = current_user.english_grades.all
    end

#using the incorrect params jst to make it work
    def show
        @student = Student.find_by_id(params[:id])
        @all_maths_grades = @student.maths_grades.all
    @all_english_grades = @student.english_grades.all
    end
end
#where('email' => current_user.teacher_email)