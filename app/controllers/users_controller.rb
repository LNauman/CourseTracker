class UsersController < ApplicationController
  def index
    redirect_to root_path, notice: 'Sign in to access your Course Tracker!'
  end
  
  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: 'You need to sign in to see this page'
    end
  end 
end
