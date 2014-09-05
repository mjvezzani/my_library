class FriendsController < ApplicationController

  before_action :require_user
  
  def index
    @friends = Friend.where(user_id: current_user.id)
  end

  def show
    @friend = Friend.where(user_id: current_user.id, id: params[:id]).first
  end

  def new
    @friend = Friend.new()
  end

  def create
    binding.pry
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      flash[:notice] = 'Friend added to the directory'
      redirect_to friends_path
    else
      render :new
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])

    if @friend.update(friend_params)
      flash[:notice] = "#{@friend.full_name}'s contact info updated"
      redirect_to friends_path
    else
      render :edit
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :address, :phone, :user_id)
  end

end
