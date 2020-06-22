class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    valid_user = user.try(:authenticate, params[:user][:password])
    session[:user_id] = valid_user.id if valid_user
    redirect_to '/'
  end

  def destroy
    session.delete(:user_id)
  end
end