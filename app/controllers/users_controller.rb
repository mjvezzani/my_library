class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.create(user_params)

    else
      flash[:error] = "I'm sorry. Something went wrong."
      render :new
    end
  end

end
