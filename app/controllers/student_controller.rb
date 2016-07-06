class StudentController < ApplicationController

    def index
        @teacher = Teacher.where('email' => current_user.teacher_email)
        @all_grades = current_user.grades.all
    end


    def show
        @student = Student.find_by_id(params[:id])
        @all_grades = @student.grades.all

    end
end
#where('email' => current_user.teacher_email)