class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render :new
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by username: (params[:username])
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
