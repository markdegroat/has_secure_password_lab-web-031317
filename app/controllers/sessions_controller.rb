class SessionsController < ApplicationController

  def new
  end


  def create
    #byebug
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :name
    redirect_to '/'
  end



end
