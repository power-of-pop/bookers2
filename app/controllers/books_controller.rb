class BooksController < ApplicationController
  def new
    @book = Book.new
    @book = Book.all
  end

  # 投稿データの保存
  def create
    @book = PostImage.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
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
      params.require(:post_image).permit(:shop_name, :image, :caption)
    end
    
end
