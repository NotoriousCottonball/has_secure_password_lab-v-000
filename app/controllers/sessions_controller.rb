class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(name: params[:user][:name])
    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      return head(:forbidden)
      
    end
  end

  def destroy
    session.delete :user_id

     redirect_to root
  end

 end