class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "Nice to meet you #{@user.name}"            
      redirect_to login_path
    else
      flash.now[:danger] = "Pls one more try"      
      render :template => "users/new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
end
