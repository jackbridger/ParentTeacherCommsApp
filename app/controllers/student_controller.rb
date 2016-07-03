class StudentController < ApplicationController

    def index
        @teacher = Teacher.where('email' => current_user.teacher_email)
    end

end
#where('email' => current_user.teacher_email)