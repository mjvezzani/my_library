class FriendsController < ApplicationController

  before_action :require_user
  before_action :set_friend
  
  def index
    @friends = Friend.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @friend = Friend.new()
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      flash[:notice] = "#{@friend.full_name} added to the directory"
      redirect_to friends_path
    else
      render :new
    end
  end

  def edit
  end

  def update
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

  def set_friend
    @friend = Friend.where(user_id: current_user.id, slug: params[:id]).first
  end

end
