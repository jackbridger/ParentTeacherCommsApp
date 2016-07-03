class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :type, :teacher_email])
  end


  def after_sign_in_path_for(resource)
      if resource.type == 'Teacher'
        teacher_index_path
      else
        student_index_path
      end
    end

    def stored_locations_for(resource)
    end

end
