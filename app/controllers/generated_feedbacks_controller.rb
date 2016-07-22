class GeneratedFeedbacksController < ApplicationController
  before_action :set_generated_feedback, only: [:show, :edit, :update, :destroy]

  # GET /generated_feedbacks
  # GET /generated_feedbacks.json
  def index
    @generated_feedbacks = GeneratedFeedback.all
  end

  # GET /generated_feedbacks/1
  # GET /generated_feedbacks/1.json
  def show
  end

  # GET /generated_feedbacks/new
  def new
    @generated_feedback = GeneratedFeedback.new :teacher_id => params[:teacher_id], :performance_grade => params[:performance_grade], :subject => params[:subject], :subcategory => params[:subcategory]
  end

  # GET /generated_feedbacks/1/edit
  def edit
  end

  # POST /generated_feedbacks
  # POST /generated_feedbacks.json
  def create
    @generated_feedback = GeneratedFeedback.new(generated_feedback_params)

      if @generated_feedback.save
      redirect_to(edit_auto_gens_path, :notice => "Generated feedback was successfully created.")
    else
      redirect_to(edit_auto_gens_path, :notice => "Generated feedback was not successfully created.")
    end
  end

  # PATCH/PUT /generated_feedbacks/1
  # PATCH/PUT /generated_feedbacks/1.json
  def update

    if @generated_feedback.update(generated_feedback_params)
      redirect_to(edit_auto_gens_path, :notice => "Generated feedback was successfully edited.")
    else
      redirect_to(edit_auto_gens_path, :notice => "Generated feedback was not successfully edited.")
    end
  end

  # DELETE /generated_feedbacks/1
  # DELETE /generated_feedbacks/1.json
  def destroy
    if @generated_feedback.destroy
      redirect_to(edit_auto_gens_path, :notice => "Generated feedback was successfully destroyed.")
    else
      redirect_to(edit_auto_gens_path, :notice => "Generated feedback was not successfully destroyed.")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generated_feedback
      @generated_feedback = GeneratedFeedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generated_feedback_params
      params.require(:generated_feedback).permit(:performance_grade, :teacher_id, :subject, :auto_feedback, :subcategory)
    end
end
