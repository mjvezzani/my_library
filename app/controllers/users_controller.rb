class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create]
  
  def index
    redirect_to edit_user_path(current_user)
  end

  def show
    redirect_to edit_user_path(current_user)
  end

  def new
    if logged_in?
      redirect_to edit_user_path(current_user)
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Welcome to the book checkout app. To get started, add some books, friends, and categories, and then browse around.'
      session[:user_id] = @user.id

      if session[:user_id] == @user.id
        redirect_to dashboard_path
      else
        session[:user_id] = nil
        redirect_to register_path
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)

    if @user.update(user_params)
      flash[:success] = 'You have successfully updated your profile'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
