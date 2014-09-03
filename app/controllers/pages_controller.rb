class PagesController < ApplicationController

  before_action :require_user

  def index
    @books = Book.all    
    @cobs = Book.where(checked_out: true)
  end

end
