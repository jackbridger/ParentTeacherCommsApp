class ChooseSubjectsController < ApplicationController



    def index
        @student = Student.find_by_id(params[:student_id])
    end
end
