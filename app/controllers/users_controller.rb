class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @users = User.all
  end

  def index
    @users = User.all
  end

  def show
    @books = Book.where(user_id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
