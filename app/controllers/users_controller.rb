class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    redirect_to new_user_path unless @user.password == @user.password_confirmation

    session[:user_id] = @user.id
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
