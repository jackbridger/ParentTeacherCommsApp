class StudentController < ApplicationController
before_filter :authenticate_user!
before_filter do
    redirect_to new_user_session_path unless current_teacher || params[:id] == nil
    end


    def current_teacher
        current_user.type == 'Teacher'
    end




    def index
        @teacher = Teacher.where('email' => current_user.teacher_email)
        #really hacky but so that i can still do .each and with this select a single teacher
        @teacher_other = Teacher.where('email' => current_user.teacher_email).first
        @all_english_grades = current_user.english_grades.all

        @all_maths_grades = current_user.maths_grades.all
        @latest_two_english_grade = EnglishGrade.where(:student_id => current_user.id).last(2)
        @latest_two_maths_grade = MathsGrade.where(:student_id => current_user.id).last(2)

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

        #Maths
        #Generated feedback - number
        @generated_feedback_number_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Not-started'}).last
        @generated_feedback_number_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Working-towards'}).last
        @generated_feedback_number_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Working-at'}).last
        @generated_feedback_number_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Greater-depth'}).last

        #Generated feedback - measurement
        @generated_feedback_measurement_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Not-started'}).last
        @generated_feedback_measurement_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Working-towards'}).last
        @generated_feedback_measurement_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Working-at'}).last
        @generated_feedback_measurement_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Greater-depth'}).last

        #Generated feedback - geometry
        @generated_feedback_geometry_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Not-started'}).last
        @generated_feedback_geometry_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Working-towards'}).last
        @generated_feedback_geometry_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Working-at'}).last
        @generated_feedback_geometry_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Greater-depth'}).last


        #Tasks
        @all_tasks = Task.where({teacher_id: @teacher_other.id}).all


        #Tips

        @tip = Tip.where(:audience => 'student').order('RANDOM()').first
    end

#using the incorrect params jst to make it work
    def show
        @student = Student.find_by_id(params[:id])
        @all_maths_grades = @student.maths_grades.all
    @all_english_grades = @student.english_grades.all


      @teacher_other = current_user

        @latest_two_english_grade = EnglishGrade.where(:student_id => @student.id).last(2)
        @latest_two_maths_grade = MathsGrade.where(:student_id => @student.id).last(2)

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

        #Maths
        #Generated feedback - number
        @generated_feedback_number_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Not-started'}).last
        @generated_feedback_number_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Working-towards'}).last
        @generated_feedback_number_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Working-at'}).last
        @generated_feedback_number_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Number', performance_grade: 'Greater-depth'}).last

        #Generated feedback - measurement
        @generated_feedback_measurement_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Not-started'}).last
        @generated_feedback_measurement_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Working-towards'}).last
        @generated_feedback_measurement_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Working-at'}).last
        @generated_feedback_measurement_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Measurement', performance_grade: 'Greater-depth'}).last

        #Generated feedback - geometry
        @generated_feedback_geometry_not_started = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Not-started'}).last
        @generated_feedback_geometry_working_towards = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Working-towards'}).last
        @generated_feedback_geometry_working_at = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Working-at'}).last
        @generated_feedback_geometry_greater_depth = GeneratedFeedback.where({teacher_id: @teacher_other.id, subject: 'Maths', subcategory: 'Geometry', performance_grade: 'Greater-depth'}).last

    end

    def all_english_grades

    end

    def all_maths_grades

    end



end
#where('email' => current_user.teacher_email)