class BooksController < ApplicationController
  def new
    @book = Book.new
    @book = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end

    # 投稿データのストロングパラメータ
    private

    def book_params
      params.require(:book).permit(:title, :body)
    end
    
end
