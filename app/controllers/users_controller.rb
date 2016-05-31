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

  def show
    @user = User.find_by username: (params[:username])
    if current_user
      render :show
    else
      redirect_to :login
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      # Handle a successful update.
      redirect_to user_path
    else
      render :show
    end
  end

  def destroy
    @user = current_user
    session[:user_id] = nil
    @user.destroy
    redirect_to '/'
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
