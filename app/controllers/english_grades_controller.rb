class EnglishGradesController < ApplicationController
  before_action :set_english_grade, only: [:show, :edit, :update, :destroy]

  # GET /english_grades
  # GET /english_grades.json
  def index
    @english_grades = EnglishGrade.all
  end

  # GET /english_grades/1
  # GET /english_grades/1.json
  def show
  end

  # GET /english_grades/new
  def new
    @english_grade = EnglishGrade.new
    @english_grade.teacher_id = current_user.id
    @student = Student.find(params[:student_id])
    @english_grade.student_id = @student.id
  end

  # GET /english_grades/1/edit
  def edit

  end

  # POST /english_grades
  # POST /english_grades.json
  def create
    @english_grade = EnglishGrade.new(english_grade_params)
    @student = Student.find_by_id(@english_grade.student_id)
      if @english_grade.save
        redirect_to(student_path(@student), :notice => "Post was successfully created.")
      else
redirect_to(student_path(@student), :notice => "Post was successfully created.")
      end

  end

  # PATCH/PUT /english_grades/1
  # PATCH/PUT /english_grades/1.json
  def update
    @student = Student.find_by_id(@english_grade.student_id)
      if @english_grade.update(english_grade_params)
redirect_to(student_path(@student), :notice => "Post was successfully created.")
      else
redirect_to(student_path(@student), :notice => "Post was successfully created.")
      end
  end

  # DELETE /english_grades/1
  # DELETE /english_grades/1.json
  def destroy
    @english_grade.destroy
    respond_to do |format|
      format.html { redirect_to english_grades_url, notice: 'English grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_english_grade

      @english_grade = EnglishGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def english_grade_params
      params.require(:english_grade).permit(:teacher_id, :student_id, :title, :subcategory, :performance_grade, :feedback, :grade_date)
    end
end
