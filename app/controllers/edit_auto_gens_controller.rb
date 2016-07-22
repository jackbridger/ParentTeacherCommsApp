class EditAutoGensController < ApplicationController

    def index
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

        #Maths grades number
        @number_recent_not_started = GeneratedFeedback.where({subcategory: 'Number',teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Not-started'}).last
        @number_recent_working_towards = GeneratedFeedback.where({subcategory: 'Number', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Working-towards'}).last
        @number_recent_working_at = GeneratedFeedback.where({subcategory: 'Number', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Working-at'}).last
        @number_recent_greater_depth = GeneratedFeedback.where({subcategory: 'Number', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Greater-depth'}).last

        #Maths grades measurement
        @measurement_recent_not_started = GeneratedFeedback.where({subcategory: 'Measurement',teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Not-started'}).last
        @measurement_recent_working_towards = GeneratedFeedback.where({subcategory: 'Measurement', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Working-towards'}).last
        @measurement_recent_working_at = GeneratedFeedback.where({subcategory: 'Measurement', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Working-at'}).last
        @measurement_recent_greater_depth = GeneratedFeedback.where({subcategory: 'Measurement', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Greater-depth'}).last

        #Geometry
        @geometry_recent_not_started = GeneratedFeedback.where({subcategory: 'Geometry',teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Not-started'}).last
        @geometry_recent_working_towards = GeneratedFeedback.where({subcategory: 'Geometry', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Working-towards'}).last
        @geometry_recent_working_at = GeneratedFeedback.where({subcategory: 'Geometry', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Working-at'}).last
        @geometry_recent_greater_depth = GeneratedFeedback.where({subcategory: 'Geometry', teacher_id: current_user.id, subject: 'Maths', performance_grade: 'Greater-depth'}).last

    end
end
