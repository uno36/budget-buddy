class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @category.transactions.sum(:amount)
  end

  def new
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