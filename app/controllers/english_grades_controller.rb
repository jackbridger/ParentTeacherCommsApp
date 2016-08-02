class EnglishGradesController < ApplicationController
  before_action :set_english_grade, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
before_filter do
    redirect_to new_user_session_path unless current_teacher || current_student
end


    def current_teacher
        current_user.type == 'Teacher'
    end

    def current_student
        @english_grade = EnglishGrade.find(params[:id])
        @student = Student.find_by_id(@english_grade.student_id)
        @student.id == current_user.id
    end
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
    @english_grade = EnglishGrade.find(params[:id])
    @student = Student.find_by_id(@english_grade.student_id)
  end

  # POST /english_grades
  # POST /english_grades.json
  def create
    @english_grade = EnglishGrade.new(english_grade_params)
    @student = Student.find_by_id(@english_grade.student_id)
      if @english_grade.save
        UserMailer.new_grade(@student).deliver
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
    @student = Student.find_by_id(@english_grade.student_id)
    if @english_grade.destroy
      redirect_to(student_path(@student), :notice => "Post was successfully created.")
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
