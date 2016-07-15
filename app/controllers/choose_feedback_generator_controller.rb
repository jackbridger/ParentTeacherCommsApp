class ChooseFeedbackGeneratorController < ApplicationController
    def index
        @teacher = Teacher.find_by_id(params[:teacher_id])
    end
end
