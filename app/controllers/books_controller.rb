class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = 'Book created'
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      if @book.checked_out == false || nil
        @book.friend = nil
      end
      flash[:success] = 'Lending status updated'
      redirect_to dashboard_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to book_path(@book)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :user_id, :friend_id, :checked_out)
  end

end
