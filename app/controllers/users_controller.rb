class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Welcome to the book checkout app'
      # <<--##$$ This redirect needs correcting $$##-->>
      redirect_to login_path
    else
      flash[:error] = "I'm sorry. Something went wrong."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
