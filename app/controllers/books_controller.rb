class BooksController < ApplicationController

  before_action :require_user

  def index
    @books = Book.where(user_id: current_user.id)
  end

  def show
    @book = Book.where(user_id: current_user.id, id: params[:id]).first
    binding.pry
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.checked_out = false
    if @book.save
      flash[:success] = 'Book created'
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
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
