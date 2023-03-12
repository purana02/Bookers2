class BooksController < ApplicationController
  def new
    @booknew=Book.new
  end

  def index
    @booknew=Book.new
    @books=Book.all
    @book=Book.new
  end

  def create
   @books= Book.all
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      flash[:notice]="You have createded books successfully."
      redirect_to book_path(@book)
   else
     render :index
   end
  end

  def show
    @book= Book.new
    @book= Book.find(params[:id])
  end

  def destroy
    @book= Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice]="You have updated book successfully."
       redirect_to book_path(@book)
    else
       render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
