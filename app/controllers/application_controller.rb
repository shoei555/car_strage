class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_num,:last_name,:first_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:employee_num])
  end
end
