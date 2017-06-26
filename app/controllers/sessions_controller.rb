class SessionsController < ApplicationController
  def new
  end
  
  # アカウントの新規作成
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?  # アカウントが有効化されたか
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user  # リクエストされたURLが存在する場合はそこにリダイレクトし、ない場合は何らかのデフォルトのURLにリダイレクト
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      #flash.nowのメッセージはその後リクエストが発生したときに消滅します
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
