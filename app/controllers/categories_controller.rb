class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show
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
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category successfully updated'
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.where(user_id: current_user.id, slug: params[:id]).first
  end
end
