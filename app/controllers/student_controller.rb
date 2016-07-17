class StudentController < ApplicationController
before_filter :authenticate_user!
before_filter do
    redirect_to new_user_session_path unless current_teacher || params[:id] == nil
    end


    def current_teacher
        current_user.type == 'Teacher'
    end




    def index
        @teacher = Teacher.where('email' => current_user.teacher_email)
        #really hacky but so that i can still do .each and with this select a single teacher
        @teacher_other = Teacher.where('email' => current_user.teacher_email).first
        @all_english_grades = current_user.english_grades.all
        @all_maths_grades = current_user.maths_grades.all
        @latest_english_grade = current_user.english_grades.last

        @generated_feedback = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', performance_grade: @latest_english_grade.performance_grade}).first

        #Tasks
        @all_tasks = Task.where({teacher_id: @teacher_other.id}).all
    end

#using the incorrect params jst to make it work
    def show
        @student = Student.find_by_id(params[:id])
        @all_maths_grades = @student.maths_grades.all
    @all_english_grades = @student.english_grades.all
    end


end
#where('email' => current_user.teacher_email)