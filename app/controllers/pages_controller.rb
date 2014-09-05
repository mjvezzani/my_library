class PagesController < ApplicationController

  before_action :require_user

  def index
    @books = Book.where(user_id: current_user.id)
    @lobs = Book.where({user_id: current_user.id, checked_out: true})
  end

end
