class BooksController < ApplicationController

  before_action :require_user
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    set_owner_and_checked_out_status
    if @book.save
      flash[:success] = 'Book created'
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      check_book_status 
      flash[:success] = 'Lending status updated'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:alert] = "#{@book.title} removed from your library."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn,
                                 :user_id, :friend_id, :checked_out, :synopsis, :review,
                                 category_ids: [])
  end

  def set_book
    @book = Book.where(user_id: current_user.id, slug: params[:id]).first
  end

  def check_book_status
    if @book.checked_out == false || nil
      @book.friend = nil
      @book.save
    end
  end

  def set_owner_and_checked_out_status
    @book.user_id = current_user.id
    @book.checked_out = false
  end
end
