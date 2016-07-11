class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new :teacher_id => current_user.id, :subject => "Maths"
    @student =  Student.find(params[:student_id])
    @grade.student_id = @student.id
  end

  # GET /grades/1/edit
  def edit
       @student =  Student.find(params[:student_id])
       @grade = Grade.find(params[:grade_id])
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

      if @grade.save
        redirect_to(student_path(:id => @grade.student_id), :notice => "Post was successfully created.")
      else
        redirect_to(new_grade_path(:id => grade.id), :notice => "Post was not created.")
      end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    p "#{params} <<<<<<<<<<<<<<"
    @grade = Grade.find(params[:grade_id])
    p " grade..."
    p @grade
      if @grade.update(grade_params)
          redirect_to(student_path(:grade_id => @grade.student_id), :notice => "Post was successfully edited.")
      else
        redirect_to(new_grade_path(:grade_id => grade.id), :notice => "Post was not edited.")
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:grade_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      #user needs to submit some feedback for it to be saved
      params.require(:grade).require(:feedback)
      params.require(:grade).permit(:student_id, :teacher_id, :feedback, :percentage_score, :grade_type, :grade_letter, :grade_date, :subject)


    end
end
