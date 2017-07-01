class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location        #リクエストが送られたURLをsession変数の:forwarding_urlキーに格納
        flash[:danger] = "Pelase log in"
        redirect_to login_url
      end
    end
end
