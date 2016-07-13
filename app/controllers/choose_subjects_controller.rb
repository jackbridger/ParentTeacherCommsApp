class ChooseSubjectsController < ApplicationController



    def index
        @student = Student.find_by_id(params[:student_id])
        @teacher = Teacher.find_by_id(params[:teacher_id])
    end
end
