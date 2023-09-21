class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = if params[:search].present?
                    # Implement your search logic here
                    # For example, fetch categories matching the search query
                    Category.where('name LIKE ?', "%#{params[:search]}%")
                  else
                    # Fetch all categories for the currently logged-in user
                    current_user.categories
                  end
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
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
