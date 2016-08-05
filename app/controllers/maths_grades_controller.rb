class MathsGradesController < ApplicationController
  before_action :set_maths_grade, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
before_filter do
    redirect_to new_user_session_path unless current_teacher
end


    def current_teacher
        current_user.type == 'Teacher'
    end

    def current_student
        @maths_grade = MathsGrade.find(params[:id])
        @student = Student.find_by_id(@maths_grade.student_id)
        @student.id == current_user.id
    end
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
    @maths_grade = MathsGrade.new
    @maths_grade.teacher_id = current_user.id
    @student = Student.find(params[:student_id])
    @maths_grade.student_id = @student.id

    @tip = Tip.where(:audience => 'teacher').order('RANDOM()').first

    @all_shortcut_texts = ShortcutText.where(:teacher_id => current_user.id).all
  end

  # GET /maths_grades/1/edit
  def edit
        @maths_grade = MathsGrade.find(params[:id])
    @student = Student.find_by_id(@maths_grade.student_id)
  end

  # POST /maths_grades
  # POST /maths_grades.json
  def create
    @maths_grade = MathsGrade.new(maths_grade_params)
    @student = Student.find_by_id(@maths_grade.student_id)
    if @maths_grade.save
      UserMailer.new_grade(@student).deliver
      redirect_to(student_path(@student), :notice => "Post was successfully created.")
    else
      redirect_to(student_path(@student), :notice => "Post was successfully created.")
    end

  end

  # PATCH/PUT /maths_grades/1
  # PATCH/PUT /maths_grades/1.json
  def update
      @student = Student.find_by_id(@maths_grade.student_id)
      if @maths_grade.update(maths_grade_params)
        redirect_to(student_path(@student), :notice => "Post was successfully created.")
      else
        redirect_to(student_path(@student), :notice => "Post was successfully created.")
      end
  end

  # DELETE /maths_grades/1
  # DELETE /maths_grades/1.json
  def destroy
    @student = Student.find_by_id(@maths_grade.student_id)
    if @maths_grade.destroy
      redirect_to(student_path(@student), :notice => "Post was successfully created.")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maths_grade
      @maths_grade = MathsGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maths_grade_params
      params.require(:maths_grade).permit(:teacher_id, :student_id, :title, :subcategory, :performance_grade, :feedback, :grade_date)
    end
end
