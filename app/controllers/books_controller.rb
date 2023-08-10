class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    # @book = Book.find(params[:id])
    # @user = User.where(id: @book.user_id)
  end

  def show
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
