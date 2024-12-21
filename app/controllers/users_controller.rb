class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @users = User.all
  end

  def index
    @users = User.all
    @user = User.first
  end

  def show
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
