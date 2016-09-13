class EnglishGradesController < ApplicationController
  before_action :set_english_grade, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
before_filter do
    redirect_to new_user_session_path unless current_teacher || current_student2
end


    def current_teacher
        current_user.type == 'Teacher'
    end

    def current_student
        @english_grade = EnglishGrade.find(params[:id])
        @student = Student.find_by_id(@english_grade.student_id)
        @student.id == current_user.id
    end

    def current_student2
        @student2 = Student.find_by_id(params[:id])
        @current_student = Student.find_by_id(current_user.id)
        @student2.id == @current_student.id
    end
  # GET /english_grades
  # GET /english_grades.json
  def index
    @english_grades = EnglishGrade.all
  end

  # GET /english_grades/1
  # GET /english_grades/1.json
  def show
    if current_user.type == 'student'
      @teacher_other = Teacher.where('email' => current_user.teacher_email).first
    else
      @teacher_other = current_user
    end

    @student = Student.find_by_id(params[:id])
    @all_english_grades_students = EnglishGrade.where(:student_id => @student.id).where('grade_date < ?', Time.zone.now).all.order('grade_date DESC')
    @all_english_grades_teachers = EnglishGrade.where(:student_id => @student.id).all.order('grade_date DESC')

#English
        #Generated feedback - writing
        @generated_feedback_writing_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Not-started'}).last
        @generated_feedback_writing_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Working-towards'}).last
        @generated_feedback_writing_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Working-at'}).last
        @generated_feedback_writing_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Greater-depth'}).last
        #Generated feedback - spelling
        @generated_feedback_spelling_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Not-started'}).last
        @generated_feedback_spelling_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Working-towards'}).last
        @generated_feedback_spelling_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Working-at'}).last
        @generated_feedback_spelling_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Greater-depth'}).last
        #Generated feedback - reading
        @generated_feedback_reading_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Not-started'}).last
        @generated_feedback_reading_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Working-towards'}).last
        @generated_feedback_reading_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Working-at'}).last
        @generated_feedback_reading_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Greater-depth'}).last

  end

  # GET /english_grades/new
  def new


        #English
        #Generated feedback - writing
        @generated_feedback_writing_not_started = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Not-started'}).last
        @generated_feedback_writing_working_towards = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Working-towards'}).last
        @generated_feedback_writing_working_at = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Working-at'}).last
        @generated_feedback_writing_greater_depth = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Writing', performance_grade: 'Greater-depth'}).last
        #Generated feedback - spelling
        @generated_feedback_spelling_not_started = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Not-started'}).last
        @generated_feedback_spelling_working_towards = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Working-towards'}).last
        @generated_feedback_spelling_working_at = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Working-at'}).last
        @generated_feedback_spelling_greater_depth = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Spelling', performance_grade: 'Greater-depth'}).last
        #Generated feedback - reading
        @generated_feedback_reading_not_started = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Not-started'}).last
        @generated_feedback_reading_working_towards = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Working-towards'}).last
        @generated_feedback_reading_working_at = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Working-at'}).last
        @generated_feedback_reading_greater_depth = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English', subcategory: 'Reading', performance_grade: 'Greater-depth'}).last

      #single stuff
      @english_grade = EnglishGrade.new
      @english_grade.teacher_id = current_user.id
      @student = Student.find(params[:student_id])
      @english_grade.student_id = @student.id

      @tip = Tip.where(:audience => 'teacher').order('RANDOM()').first

      @all_shortcut_texts = ShortcutText.where(:teacher_id => current_user.id).all





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
        UserMailer.new_grade(@student).deliver_later(wait_until: @english_grade.grade_date.to_time)
        redirect_to(student_path(@student), :notice => "Post was successfully created.")
      else
        redirect_to(student_path(@student), :notice => "Post was not created.")
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
