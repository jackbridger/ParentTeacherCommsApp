class StudentController < ApplicationController

    def index
        @teacher = Teacher.where('email' => current_user.teacher_email)
    end

public
    def show
        @student = Student.find_by_id(params[:id])
    end
end
#where('email' => current_user.teacher_email)