class TeacherController < ApplicationController

    def index
        @all_users = Student.where('teacher_email' => current_user.email)
    end
#User.where(teacher_email: current_user.email)
    def first_name
        @first_name = Teacher.first_name
    end



end
