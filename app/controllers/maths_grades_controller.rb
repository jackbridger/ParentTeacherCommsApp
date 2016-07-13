class MathsGradesController < ApplicationController
  before_action :set_maths_grade, only: [:show, :edit, :update, :destroy]

  # GET /maths_grades
  # GET /maths_grades.json
  def index
    @maths_grades = MathsGrade.all
  end

  # GET /maths_grades/1
  # GET /maths_grades/1.json
  def show
  end

  # GET /maths_grades/new
  def new
    @maths_grade = MathsGrade.new :teacher_id => current_user.id
    @student =  Student.find(params[:student_id])
    @maths_grade.student_id = @student.id
  end

  # GET /maths_grades/1/edit
  def edit
        @student =  Student.find(params[:student_id])
       @maths_grade = MathsGrade.find(params[:grade_id])
  end

  # POST /maths_grades
  # POST /maths_grades.json
  def create
    @maths_grade = MathsGrade.new(maths_grade_params)

      if @maths_grade.save
        redirect_to(student_path(:student_id => @maths_grade.student_id, :grade_id => @maths_grade.id), :notice => "Post was successfully created.")
      else
        redirect_to(new_maths_grade_path(:id => @maths_grade.id), :grade_id => @maths_grade.id, :notice => "Post was not created.")
      end
  end

  # PATCH/PUT /maths_grades/1
  # PATCH/PUT /maths_grades/1.json
  def update
    @maths_grade = MathsGrade.find(params[:grade_id])
      if @maths_grade.update(maths_grade_params)
          redirect_to(student_path(:student_id => @maths_grade.student_id), :notice => "Post was successfully edited.")
      else
        redirect_to(new_maths_grade_path(:id => @maths_grade.id), :notice => "Post was not edited.")
    end
  end

  # DELETE /maths_grades/1
  # DELETE /maths_grades/1.json
  def destroy
    @maths_grade.destroy
    respond_to do |format|
      format.html { redirect_to maths_grades_url, notice: 'Maths grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maths_grade
      @maths_grade = MathsGrade.find(params[:grade_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maths_grade_params
      params.require(:maths_grade).permit(:teacher_id, :student_id, :title, :subcategory, :performance_grade, :feedback, :grade_date)
    end
end
