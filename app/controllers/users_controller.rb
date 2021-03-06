class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account successfully created"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account successfully updated"
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end