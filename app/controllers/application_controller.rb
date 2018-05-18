class ApplicationController < ActionController::Base
 # protect_from_forgery with: :exception
  before_action :current_user
  # before_action :require_sign_in!
  helper_method :signed_in?

  def current_user
    # encryptはcookieを暗号化する
    remember_token = User.encrypt(cookies[:user_remember_token])
    # current_userが定義されていなければ代入
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    # ハッシュを発行する
    remember_token = User.new_remember_token
    # ハッシュをcookieに保存 恒久的cookie
    cookies.permanent[:user_remember_token] = remember_token
    # remember_tokenをhash化する
    user.update!(remember_token: User.encrypt(remember_token))
    # userが無事updateされたら@current_userを定義してあげる
    @current_user = user
  end

  def signed_in?
    current_user.present?
  end

  def sign_out
    cookies.delete(:user_remember_token)
  end


  def require_sign_in!
    redirect_to login_path unless signed_in?
  end
end
