class BooksController < ApplicationController
  def new
    @book = Book.new
    @book = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :books
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    # if @book.update(book_params)
    #   flash[:notice] = "You have updated book successfully."
    #   redirect_to book_path(@book.id)
    # else
    #   render :edit_book
    # end
  end

    # 投稿データのストロングパラメータ
    private

    def book_params
      params.require(:book).permit(:title, :body)   if params[:book].present?
    end
    
end
