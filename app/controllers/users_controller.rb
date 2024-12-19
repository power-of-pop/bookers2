class UsersController < ApplicationController
  def edit
  end

  def index
    @users = User.all
  end

  def show
    @books = Book.where(user_id: params[:id])
  end
end
