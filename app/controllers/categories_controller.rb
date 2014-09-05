class CategoriesController < ApplicationController

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show
    @category = Category.where(user_id: current_user.id, id: params[:id]).first
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      flash[:success] = 'Category successfully created'
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.where(user_id: current_user.id, id: params[:id]).first
  end

  def update
    @category = Category.where(user_id: current_user.id, id: params[:id]).first

    if @category.update(category_params)
      flash[:success] = 'Category successfully updated'
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
