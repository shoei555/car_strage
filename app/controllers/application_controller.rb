class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :set_search

  
    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
      end
    end
      
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_num,:last_name,:first_name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:employee_num])
    end

    def set_search
      @q = Car.ransack(params[:q])
      @cars = @q.result
    end
end