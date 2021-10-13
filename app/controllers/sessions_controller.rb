class SessionsController < ApplicationController

  def new
    redirect_to user_path(@current_user) if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to user_path(user)
    else
        flash.now[:danger] = "Email and password didn't matched"
        render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    render 'new'
  end
end