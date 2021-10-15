class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end

  def create
    # render plain: params[:category].inspect
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      flash[:notice] ="Category sucessfullly added"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] ="Category sucessfullly edited"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category Successfully deleted"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:description)
  end

end