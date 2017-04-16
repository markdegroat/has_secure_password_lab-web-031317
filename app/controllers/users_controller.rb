class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def create
    #if you save in the same line, user is saved the value of "true"
    user = User.new(user_params)
    #byebug
    if user_params[:password] == user_params[:password_confirmation]
      user.save
      # byebug
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to newuser_path
    end
  end

  def show
    @user = User.find(params[:id])
    #byebug
  end


  private

  def user_params
    #byebug
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    return head(:forbidden) unless session.include? :name
  end
end
