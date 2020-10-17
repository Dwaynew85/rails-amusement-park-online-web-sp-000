class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = params[:user][:id]
    redirect_to user_path(User.find(params[:user][:id]))
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
