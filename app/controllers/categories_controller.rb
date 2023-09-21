class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    @categories = Category.includes(:transactions)
    @user = current_user
    @categories = if params[:search].present?
                    # Implement your search logic here
                    # For example, fetch categories matching the search query
                    Category.where('name LIKE ?', "%#{params[:search]}%")
                  else
                    # Fetch all categories
                    Category.all
                  end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
