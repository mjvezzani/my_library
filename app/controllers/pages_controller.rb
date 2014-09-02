class PagesController < ApplicationController

  before_action :require_user

  def index
    @books = Book.all    
  end

end
