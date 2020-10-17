class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), :alert => "You Just Signed Up"
    else
      render 'new', :alert => "Please Fill In All Forms"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), :alert => "You Just Updated Your User Account"
    else
      render 'edit', :alert => "Please Fill In All Forms"
    end
  end

  def ride
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:format])
    msg = @ride.take_ride
    redirect_to user_path(current_user), :alert => msg
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin)
  end

end