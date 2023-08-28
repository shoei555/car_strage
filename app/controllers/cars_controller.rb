class CarsController < ApplicationController
  before_action :log_out, only:[:index]

  def index
  
  end
 
  private
  def log_out #ログアウト状態ではログイン画面へ遷移
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
