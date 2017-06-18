module SessionsHelper
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        # @current_user の定義
        # 現在ログイン中のユーザーを返す (いる場合)
    end
    
    def logged_in?
        !current_user.nil?
        # current_user が ログイン(=true) しているかどうか
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
