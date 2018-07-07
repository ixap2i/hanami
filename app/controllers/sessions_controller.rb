class SessionsController < ApplicationController
  before_action :require_sign_in!, only: [:destroy]
  before_action :set_user, only: [:create]
  skip_before_action :require_sign_in!, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    # authenticateは認証に失敗したらfalseを返す
    if @user.present?
      if @user.authenticate(session_params[:password])
        # sessionをcreateして、最初のページにリダイレクト
        sign_in(@user)
        flash.now[:success] = "いらっしゃいませ!"
        render "new"
      else
        flash.now[:danger] = "入力された情報に誤りがあります"
        render :template => "sessions/new"
      end
    else
      flash.now[:danger] = "もう一度ログインしてください"
      render "new"
    end
  end
  
  def destroy
    sign_out
    redirect_to login_path
  end

  private

  def set_user
    @user = User.find_by(mail: session_params[:mail])
  rescue
    flash.now[:danger] = "このメールは登録されていません"
    render action: "new"
  end

  def session_params
    params.require(:session).permit(:mail, :password)
  end
end
