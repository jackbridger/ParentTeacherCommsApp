class MathsGradesController < ApplicationController
  before_action :set_maths_grade, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
before_filter do
    redirect_to new_user_session_path unless current_teacher || current_student2
end


    def current_teacher
        current_user.type == 'Teacher'
    end

    def current_student
        @maths_grade = MathsGrade.find(params[:id])
        @student = Student.find_by_id(@maths_grade.student_id)
        @student.id == current_user.id
    end

    #checking if it's the current student

    def current_student2
        @student2 = Student.find_by_id(params[:id])
        @current_student = Student.find_by_id(current_user.id)
        @student2.id == @current_student.id
    end
  # GET /maths_grades
  # GET /maths_grades.json
  def index

  end

  # GET /maths_grades/1
  # GET /maths_grades/1.json
  def show



     @student = Student.find_by_id(params[:id])

     if current_user.type == 'Student'
      @all_maths_grades = MathsGrade.where(:student_id => @student.id).where('grade_date < ?', Time.zone.now).all.order('grade_date DESC')
     else
      @all_maths_grades = MathsGrade.where(:student_id => @student.id).all.order('grade_date DESC')
     end

    #Maths


  end

  # GET /maths_grades/new
  def new

      @maths_grade = MathsGrade.new
      @maths_grade.teacher_id = current_user.id
      @student = Student.find(params[:student_id])
      @maths_grade.student_id = @student.id

      @all_shortcut_texts = ShortcutText.where(:teacher_id => current_user.id).all
    @tip = Tip.where(:audience => 'teacher').order('RANDOM()').first


 #Generated feedback - number
        @generated_feedback_number_not_started = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Not-started'}).last
        @generated_feedback_number_working_towards = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Working-towards'}).last
        @generated_feedback_number_working_at = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Working-at'}).last
        @generated_feedback_number_greater_depth = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Greater-depth'}).last

        #Generated feedback - measurement
        @generated_feedback_measurement_not_started = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Not-started'}).last
        @generated_feedback_measurement_working_towards = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Working-towards'}).last
        @generated_feedback_measurement_working_at = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Working-at'}).last
        @generated_feedback_measurement_greater_depth = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Greater-depth'}).last

        #Generated feedback - geometry
        @generated_feedback_geometry_not_started = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Not-started'}).last
        @generated_feedback_geometry_working_towards = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Working-towards'}).last
        @generated_feedback_geometry_working_at = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Working-at'}).last
        @generated_feedback_geometry_greater_depth = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Greater-depth'}).last


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
      UserMailer.new_grade(@student).deliver_later(wait_until: @maths_grade.grade_date.to_time)
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
