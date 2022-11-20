class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:edit_message] = 'Book was successfully updated'
      redirect_to book_path(book.id)
    else
      @book=Book.find(params[:id])
      @book.update(book_params)
      render :edit
    end
  end
  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:create_message] = 'Book was successfully created'
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:delete_message] = 'Book was successfully deleted'
    redirect_to books_path
  end 
  
  def new
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
