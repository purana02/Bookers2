class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  
  def index
    @book=Book.new
    @books=Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @books= Book.all
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def show
    @book= Book.new
    @book= Book.find(params[:id])
  end
  
  def destroy
  end
  
  def edit
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
