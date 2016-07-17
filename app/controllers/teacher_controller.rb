class TeacherController < ApplicationController
before_filter :authenticate_user!
    def index
        @teacher = Teacher.find_by_id(current_user.id)
        @all_students = Student.where('teacher_email' => current_user.email)

        #feedback
        @all_generated_feedback = GeneratedFeedback.where({teacher_id: current_user.id, subject: 'English'}).all

        #English grades spelling
        @spelling_recent_not_started = GeneratedFeedback.where({subcategory: 'Spelling',teacher_id: current_user.id, subject: 'English', performance_grade: 'Not-started'}).last
        @spelling_recent_working_towards = GeneratedFeedback.where({subcategory: 'Spelling', teacher_id: current_user.id, subject: 'English', performance_grade: 'Working-towards'}).last
        @spelling_recent_working_at = GeneratedFeedback.where({subcategory: 'Spelling', teacher_id: current_user.id, subject: 'English', performance_grade: 'Working-at'}).last
        @spelling_recent_greater_depth = GeneratedFeedback.where({subcategory: 'Spelling', teacher_id: current_user.id, subject: 'English', performance_grade: 'Greater-depth'}).last
        #English grades writing
        @writing_recent_not_started = GeneratedFeedback.where({subcategory: 'Writing',teacher_id: current_user.id, subject: 'English', performance_grade: 'Not-started'}).last
        @writing_recent_working_towards = GeneratedFeedback.where({subcategory: 'Writing', teacher_id: current_user.id, subject: 'English', performance_grade: 'Working-towards'}).last
        @writing_recent_working_at = GeneratedFeedback.where({subcategory: 'Writing', teacher_id: current_user.id, subject: 'English', performance_grade: 'Working-at'}).last
        @writing_recent_greater_depth = GeneratedFeedback.where({subcategory: 'Writing', teacher_id: current_user.id, subject: 'English', performance_grade: 'Greater-depth'}).last
        #English grades reading
        @reading_recent_not_started = GeneratedFeedback.where({subcategory: 'Reading',teacher_id: current_user.id, subject: 'English', performance_grade: 'Not-started'}).last
        @reading_recent_working_towards = GeneratedFeedback.where({subcategory: 'Reading', teacher_id: current_user.id, subject: 'English', performance_grade: 'Working-towards'}).last
        @reading_recent_working_at = GeneratedFeedback.where({subcategory: 'Reading', teacher_id: current_user.id, subject: 'English', performance_grade: 'Working-at'}).last
        @reading_recent_greater_depth = GeneratedFeedback.where({subcategory: 'Reading', teacher_id: current_user.id, subject: 'English', performance_grade: 'Greater-depth'}).last


        #tasks
        @all_tasks = Task.where({teacher_id: current_user.id})


    end
#User.where(teacher_email: current_user.email)
    def first_name
        @first_name = Teacher.first_name
    end



end
