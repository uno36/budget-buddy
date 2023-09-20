class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
  @categories = Category.all
  @user = current_user
  if params[:search].present?
    # Implement your search logic here
    # For example, fetch categories matching the search query
    @categories = Category.where('name LIKE ?', "%#{params[:search]}%")
  else
    # Fetch all categories
    @categories = Category.all
  end
end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end
end

