class TeacherController < ApplicationController
before_filter :authenticate_user!
    def index
        @teacher = Teacher.find_by_id(current_user.id)
        @all_students = Student.where('teacher_email' => current_user.email)

        #feedback
        @all_generated_feedback = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English'}).all


        #tasks
        @all_tasks = Task.where({teacher_id: current_user.id})


    end
#User.where(teacher_email: current_user.email)
    def first_name
        @first_name = Teacher.first_name
    end



end
