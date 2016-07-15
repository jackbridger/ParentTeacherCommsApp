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
    @generated_feedback = GeneratedFeedback.new
  end

  # GET /generated_feedbacks/1/edit
  def edit
  end

  # POST /generated_feedbacks
  # POST /generated_feedbacks.json
  def create
    @generated_feedback = GeneratedFeedback.new(generated_feedback_params)

    respond_to do |format|
      if @generated_feedback.save
        format.html { redirect_to @generated_feedback, notice: 'Generated feedback was successfully created.' }
        format.json { render :show, status: :created, location: @generated_feedback }
      else
        format.html { render :new }
        format.json { render json: @generated_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generated_feedbacks/1
  # PATCH/PUT /generated_feedbacks/1.json
  def update
    respond_to do |format|
      if @generated_feedback.update(generated_feedback_params)
        format.html { redirect_to @generated_feedback, notice: 'Generated feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @generated_feedback }
      else
        format.html { render :edit }
        format.json { render json: @generated_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generated_feedbacks/1
  # DELETE /generated_feedbacks/1.json
  def destroy
    @generated_feedback.destroy
    respond_to do |format|
      format.html { redirect_to generated_feedbacks_url, notice: 'Generated feedback was successfully destroyed.' }
      format.json { head :no_content }
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
