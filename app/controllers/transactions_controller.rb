class TransactionsController < ApplicationController
  
  def index
    @category = Category.find_by(id: params[:category_id])

    if @category
      @transactions = @category.transactions.order(created_at: :desc)
      @total_amount = @category.transactions.sum(:amount)
    else
      # Handle the case when the category is not found
      flash[:alert] = "Category not found"
      redirect_to categories_path # You can redirect to a suitable page
    end
  end

  def new
    @transaction = Transaction.new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new    
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category)
    else
      render 'new'
    end
  end
end
