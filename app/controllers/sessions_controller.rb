class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    session[:user_id] = user.id if user
  end
end
