class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new()
  end

  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      flash[:success] = 'Friend added'
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :address, :phone, :user_id)
  end

end
